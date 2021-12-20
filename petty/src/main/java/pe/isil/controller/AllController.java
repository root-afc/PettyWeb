package pe.isil.controller;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;
import com.amazonaws.services.sqs.model.SendMessageRequest;
import com.amazonaws.services.sqs.model.SendMessageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.isil.model.*;
import pe.isil.service.*;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class AllController {

    @Autowired
    ProductService productService;
    @Autowired
    PaymentService paymentService;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    PurchaseDetailsService purchaseDetailsService;
    @Autowired
    IsilUserDetailsService isilUserDetailsService;
    @Autowired
    User_RoleService userRoleService;
    Car car = new Car();
    int cantidad = 0;
    Double subtotal = 0.0;
    List<Car> listaProductos = new ArrayList<>();
    double total;

    @GetMapping(value = {"/index", "/"})
    public String getIndex() {
        return "index";
    }

    @RequestMapping(value = {"/shop/{id}", "/shop"})
    public String getAllProducts(Model model, @PathVariable(name = "id", required = false) Integer id) {
        List<Product> products = null;
        if (id != null) {
            switch (id) {
                case 1:
                    products = productService.productByCategoryDogs();
                    break;
                case 2:
                    products = productService.productByCategoryCats();
                    break;
            }
        } else {
            products = productService.getAll();
        }
        model.addAttribute("products", products);
        return "shop";
    }

    @GetMapping("/checkout")
    public String Checkout(Model model) {
        model.addAttribute("listProducts", listaProductos);
        model.addAttribute("total", String.format("%.2f", total));
        if (listaProductos.size() != 0) {
            return "checkout";
        } else {
            return "redirect:/shop";
        }
    }

    @PostMapping("/payments/save")
    public String Payment(Model model, Principal principal) {
        Payment payment = new Payment();
        total = Math.round(total * 100.0) / 100.0;
        payment.setMonto(total);
        paymentService.create(payment);
        Purchase purchase = new Purchase();
        Users usersNow = new Users();
        Optional<Users> currentUser = isilUserDetailsService.findByUsername(principal.getName());
        if (currentUser.isPresent()) {
            usersNow = currentUser.get();
        }
        purchase.setUserId(usersNow.getUserId());
        purchase.setFechacompra(LocalDate.now());
        purchase.setEstado("Completado");
        purchase.setMonto(total);
        purchase.setIdpago(payment.getIdpago());
        purchase.setCarritoList(listaProductos);
        purchaseService.create(purchase);
        Integer idcompra = 0;
        for (Car detalle : purchase.getCarritoList()
        ) {
            PurchaseDetail purchaseDetail = new PurchaseDetail();
            purchaseDetail.setIdproducto(detalle.getIdproducto());
            purchaseDetail.setIdcompra(purchase.getIdcompra());
            purchaseDetail.setCantidad(detalle.getCantidad());
            purchaseDetail.setPreciocompra(detalle.getPrecioCompra());
            purchaseDetailsService.create(purchaseDetail);
            idcompra = purchaseDetail.getIdcompra();
        }
        listaProductos.clear();
        total = 0;
        model.addAttribute("boleta", purchaseService.findById(idcompra));
        return "redirect:/ticket/" + idcompra;
    }

    @GetMapping("/ticket/{id}")
    public String Ticket(@PathVariable Integer id, Model model) {
        model.addAttribute("boleta", purchaseService.findById(id));
        return "ticket";
    }

    @GetMapping("/ticket/{id}/details")
    public String Ticket_Details(@PathVariable Integer id, Model model) {
        List<PurchaseDetail> purchaseDetail = purchaseDetailsService.DetailsPayment(id);
        model.addAttribute("detail", purchaseDetail);
        return "ticket_details";
    }


    @GetMapping("/contact")
    public String ContactUs() {
        return "contact-us";
    }

    @RequestMapping("/cart/add/{idproducto}")
    @ResponseStatus(value = HttpStatus.OK)
    public void CartAdd(@PathVariable Integer idproducto) {
        cantidad = 1;
        int pos = 0;
        total = 0;
        Product product = productService.findById(idproducto);

        if (listaProductos.size() > 0) {
            for (int i = 0; i < listaProductos.size(); i++) {
                if (listaProductos.get(i).getIdproducto() == idproducto) {
                    pos = i;
                }
            }

            if (idproducto == listaProductos.get(pos).getIdproducto()) {
                cantidad = listaProductos.get(pos).getCantidad() + cantidad;
                subtotal = listaProductos.get(pos).getPrecioCompra() * cantidad;
                subtotal = Math.round(subtotal * 100.0) / 100.0;
                listaProductos.get(pos).setCantidad(cantidad);
                listaProductos.get(pos).setSubTotal(subtotal);
            } else {
                car = new Car();
                car.setIdproducto(product.getIdproducto());
                car.setNombre(product.getNombre());
                car.setFoto_url(product.getFoto_url());
                car.setPrecioCompra(product.getPrecio());
                car.setCantidad(cantidad);
                subtotal = cantidad * product.getPrecio();
                subtotal = Math.round(subtotal * 100.0) / 100.0;
                car.setSubTotal(subtotal);
                listaProductos.add(car);
            }
        } else {
            car = new Car();
            car.setIdproducto(product.getIdproducto());
            car.setNombre(product.getNombre());
            car.setFoto_url(product.getFoto_url());
            car.setPrecioCompra(product.getPrecio());
            car.setCantidad(cantidad);
            subtotal = cantidad * product.getPrecio();
            car.setSubTotal(subtotal);
            listaProductos.add(car);
        }
        for (int i = 0; i < listaProductos.size(); i++) {
            total += listaProductos.get(i).getSubTotal();
        }
    }


    @PostMapping("/cart/delete/{idproducto}")
    public String CartDelete(@PathVariable Integer idproducto) {
        total = 0;
        for (int i = 0; i < listaProductos.size(); i++) {
            if (listaProductos.get(i).getIdproducto() == idproducto) {
                listaProductos.remove(i);
            }
        }
        for (int i = 0; i < listaProductos.size(); i++) {
            total += listaProductos.get(i).getSubTotal();
        }

        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String Cart(Model model) {
        model.addAttribute("listProducts", listaProductos);
        model.addAttribute("total", String.format("%.2f", total));
        return "cart";
    }

    @GetMapping("/account/tickets")
    public String account(Principal principal, Model model) {
        Optional<Users> currentUser = isilUserDetailsService.findByUsername(principal.getName());
        Users users = currentUser.get();
        model.addAttribute("boleta", purchaseService.findByUserId(users.getUserId()));
        return "account-tickets";
    }

    @GetMapping("/account")
    public String account_details(Principal principal, Model model) {
        Optional<Users> currentUser = isilUserDetailsService.findByUsername(principal.getName());
        Users users = currentUser.get();
        model.addAttribute("userin", users);
        return "account";
    }

    @RequestMapping("/login")
    public String Login() {
        return "login";
    }


    @GetMapping("/register")
    public String registration(Model model) {
        model.addAttribute("user", new Users());
        return "register";
    }

    @PostMapping("/register/save")
    public String registerUserSave(Users users) {
        isilUserDetailsService.create(users);
        User_Role objUR = new User_Role();
        objUR.setUser_id(users.getUserId());
        objUR.setRole_id(2);
        userRoleService.create(objUR);
        return "redirect:/login";
    }
}
