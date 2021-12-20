package pe.isil.service;

import java.util.List;

public interface GenericService <C,K>{
    List<C> getAll();

    void create(C c);

    void update(C c);

    void delete(C c);

    C findById(K k);
}
