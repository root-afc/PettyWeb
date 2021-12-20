package pe.isil.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pe.isil.model.Role;
import pe.isil.model.Users;
import pe.isil.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class IsilUserDetailsService implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    BCryptPassword bCryptPassword;

    public void create(Users users)
    {
        userRepository.save(users);
    }
    public Optional<Users> findByUsername (String user)
    {
        return  userRepository.findByUsername(user);
    }
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Users> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            Users users = optionalUser.get();
            List<String> roleList = new ArrayList<String>();
            for (Role role : users.getRoles()) {
                roleList.add(role.getRoleName());
            }
            return User.builder()
                    .username(users.getUsername())
                    .password(bCryptPassword.encode(users.getPassword()))
                    .disabled(users.isDisabled())
                    .accountExpired(users.isAccountExpired())
                    .accountLocked(users.isAccountLocked())
                    .credentialsExpired(users.isCredentialsExpired())
                    .roles(roleList.toArray(new String[0]))
                    .build();
        } else {
            throw new UsernameNotFoundException("user not found.");
        }
    }


}
