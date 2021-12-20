package pe.isil.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.isil.model.PurchaseDetail;
import pe.isil.repository.PurchaseDetailsRepository;

import java.util.List;

@Service
public class PurchaseDetailsService implements GenericService<PurchaseDetail, Integer> {
    @Autowired
    PurchaseDetailsRepository purchaseDetailsRepository;

    @Override
    public List<PurchaseDetail> getAll() {
        return null;
    }

    @Override
    public void create(PurchaseDetail purchaseDetail) {
        purchaseDetailsRepository.save(purchaseDetail);
    }

    @Override
    public void update(PurchaseDetail purchaseDetail) {

    }

    public List<PurchaseDetail> DetailsPayment(Integer idcompra)
    {
     return purchaseDetailsRepository.ShowDetailsPayment(idcompra);
    }

    @Override
    public void delete(PurchaseDetail purchaseDetail) {

    }

    @Override
    public PurchaseDetail findById(Integer integer) {
        return null;
    }
}
