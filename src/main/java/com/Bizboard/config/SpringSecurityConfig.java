package com.Bizboard.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    private final DataSource dataSource;
    
    @Autowired
    public SpringSecurityConfig(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    @Bean
    public AuthenticationSuccessHandler successHandler() {
        return new CustomLoginSuccessHandler();
    }
    

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .authorizeRequests()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/member/**").hasAnyRole("USER", "ADMIN") 
                .antMatchers("/common/**").permitAll()
                .anyRequest().permitAll() // 이외의 모든 요청을 허용
                //.anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/common/login")
                //.defaultSuccessUrl("/common/main")
                .successHandler(successHandler()) 
                .failureUrl("/common/login")
                .permitAll()
                .and()
            .logout()
                .logoutSuccessUrl("/logout")
                .logoutSuccessUrl("/common/main")
                .permitAll()
                .and()
            .exceptionHandling()
                .accessDeniedPage("/error/errorPage"); // 에러의 대한 컨트롤러 요청도 만들어야함
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        auth.jdbcAuthentication()
            .dataSource(dataSource)
            //.usersByUsernameQuery("select userid, pwd as password, 1 enabled from member where userid=?") // 원본
            //.usersByUsernameQuery("select userid, password, 1 enabled from member where userid=?") //  안되는거
            .usersByUsernameQuery("select userid, password, 1 status from members where userid=?")  //되는거
            //.usersByUsernameQuery("select userid, password from members where userid=?")  // 안되는거
            //.usersByUsernameQuery("select userid, password from members where userid=?") 안되는거 
            //.usersByUsernameQuery("select userid, password from members where userid=? and status = 1") 안되는거
            //.usersByUsernameQuery("select userid, password, 1 enabled from member where userid=? and status = 1") // 안되는거
            .authoritiesByUsernameQuery("select m.userid, r.role_name from members m join rolls r on m.userid = r.userid where m.userid=?")
            .passwordEncoder(passwordEncoder);
    }
}
