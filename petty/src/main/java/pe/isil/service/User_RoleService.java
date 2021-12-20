package pe.isil.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.isil.model.User_Role;
import pe.isil.repository.User_RoleRepository;

@Service
public class User_RoleService {
    @Autowired
    User_RoleRepository userRoleRepository;
    public void create (User_Role user_role)
    {
        userRoleRepository.save(user_role);
    }
}
