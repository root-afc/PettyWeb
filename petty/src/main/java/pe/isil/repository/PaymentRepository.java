package pe.isil.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.isil.model.Payment;
@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer> {

    @Modifying
    @Query(value = "INSERT INTO PAGO (monto) value(:monto) ", nativeQuery = true)
    void insertPayment(@Param("monto") Double monto);

}
