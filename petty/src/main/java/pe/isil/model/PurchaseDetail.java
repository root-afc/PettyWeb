package pe.isil.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "detalle_compra")
@Entity
public class PurchaseDetail {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Integer iddetalle;
    private Integer idproducto;
    private Integer idcompra;
    private Integer cantidad;
    private Double preciocompra;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "idproducto", insertable = false, updatable = false)
    private Product product;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "idcompra", insertable = false, updatable = false)
    private Purchase purchase;
}
