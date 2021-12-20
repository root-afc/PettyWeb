package pe.isil.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.isil.model.Purchase;
import pe.isil.repository.PurchaseRepository;

import java.util.List;
@Service
public class PurchaseService implements GenericService<Purchase,Integer>{
    @Autowired
    PurchaseRepository purchaseRepository;

    public List<Purchase> findByUserId(Integer id)
    {
        return purchaseRepository.findByUserId(id);
    }

    @Override
    public List<Purchase> getAll() {
        return null;
    }

    @Override
    public void create(Purchase purchase) {
    purchaseRepository.save(purchase);
    }

    @Override
    public void update(Purchase purchase) {

    }

    @Override
    public void delete(Purchase purchase) {

    }

    @Override
    public Purchase findById(Integer id) {
       return purchaseRepository.findById(id).orElse(null);
    }
}
