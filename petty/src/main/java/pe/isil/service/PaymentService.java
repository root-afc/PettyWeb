package pe.isil.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.isil.model.Payment;
import pe.isil.repository.PaymentRepository;

import java.util.List;
@Service
public class PaymentService implements GenericService<Payment, Integer> {
    @Autowired
    PaymentRepository paymentRepository;
    @Override
    public List<Payment> getAll() {
        return null;
    }

    @Override
    public void create(Payment payment) {
     paymentRepository.save(payment);
    }

    @Override
    public void update(Payment payment) {

    }

    @Override
    public void delete(Payment payment) {

    }

    @Override
    public Payment findById(Integer id) {
        return paymentRepository.findById(id).orElse(null);
    }
}
