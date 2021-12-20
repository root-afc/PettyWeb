package pe.isil.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.isil.model.Product;
import pe.isil.repository.ProductRepository;
import java.util.List;

@Service
public class ProductService implements GenericService<Product, Integer> {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> productByCategoryDogs() {
        return productRepository.getProductByCategoryDogs();
    };

    public List<Product> productByCategoryCats() {
        return productRepository.getProductByCategoryCats();
    };

    @Override
    public List<Product> getAll() {
        return productRepository.findAll();
    }

    @Override
    public void create(Product product) {
        productRepository.save(product);
    }

    @Override
    public void update(Product product) {
        productRepository.save(product);
    }

    @Override
    public void delete(Product product) {
        productRepository.delete(product);
    }

    @Override
    public Product findById(Integer id) {
        return productRepository.findById(id).orElseGet(null);
    }
}
