package pe.isil.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.query.Param;
import pe.isil.model.PurchaseDetail;

import java.util.List;

public interface PurchaseDetailsRepository extends JpaRepository<PurchaseDetail, Integer> {

    @Query(value = "select * from detalle_compra inner join producto on detalle_compra.idproducto = producto.idproducto where idcompra = :idcompra ", nativeQuery = true)
    List<PurchaseDetail> ShowDetailsPayment(@Param("idcompra") Integer idcompra);
}
