package pe.isil.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import pe.isil.service.BCryptPassword;
import pe.isil.service.IsilUserDetailsService;
@EnableWebSecurity
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    BCryptPassword bCryptPassword;
    @Autowired
    private IsilUserDetailsService isilUserDetailsService;
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(isilUserDetailsService).passwordEncoder(bCryptPassword);
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable().authorizeRequests()
                .antMatchers("/boot/**","/css/**","/fonts/**","/images/**","/js/**","/scss/**","/style.css").permitAll()
                .antMatchers("/register/**").permitAll()
                .antMatchers("/shop/**","/cart/**").permitAll()
                .antMatchers("/","/index","/contact").permitAll()
                .antMatchers("/**").hasAnyRole("USER")
                .and()
                .formLogin()
                .loginPage("/login").permitAll()
                .defaultSuccessUrl("/index")
                .failureForwardUrl("/login?error=true")
                .and()
                .logout()
                .logoutSuccessUrl("/login.html?logout");
    }
}
