package pe.isil.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Car {
    private Integer idproducto;
    private String nombre;
    private String foto_url;
    private Double precioCompra;
    private Integer cantidad;
    private double subTotal;
    private Integer idpago;
}
