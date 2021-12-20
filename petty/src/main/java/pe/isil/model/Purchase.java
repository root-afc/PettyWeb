package pe.isil.model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "compra")
@Entity
public class Purchase {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Integer idcompra;
    private LocalDate fechacompra;
    private String estado;
    private Double monto;
    private Integer idpago;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "idpago", insertable = false, updatable = false)
    private Payment payment;
    @Transient
    private List<Car> carritoList;
    @OneToMany(mappedBy = "purchase", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<PurchaseDetail> purchaseDetailList;
    @Column(name = "user_id")
    private Integer userId;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", insertable = false, updatable = false)
    private Users users;
}
