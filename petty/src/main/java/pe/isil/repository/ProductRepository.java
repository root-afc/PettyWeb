package pe.isil.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pe.isil.model.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Integer> {

    @Query(value = "SELECT * FROM producto where idcategoria = 1 ", nativeQuery = true)
    List<Product> getProductByCategoryDogs();
    @Query(value = "SELECT * FROM producto where idcategoria = 2 ", nativeQuery = true)
    List<Product> getProductByCategoryCats();

}


