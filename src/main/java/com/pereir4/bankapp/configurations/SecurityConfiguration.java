package com.pereir4.bankapp.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    // Determining which endpoints should be secure
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
        .authorizeRequests()
                .antMatchers("/myAccount").authenticated()
                .antMatchers("/myBalance").authenticated()
                .antMatchers("/myCards").authenticated()
                .antMatchers("/myLoans").authenticated()
                .antMatchers("/contact").permitAll()
                .antMatchers("/notices").permitAll()
                .and()
                .formLogin().and()
                .httpBasic();
    }

    // Ignoring security in memory database management endpoints
    @Override
    public void configure(WebSecurity web) {
        web
                .ignoring()
                .antMatchers("/h2-console/**");
    }

    // Providing and choosing BCrypt as password encoder
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // region Useful methods

    /* Configuring Jdbc as user details service (We are using a custom one)
    @Bean
    public UserDetailsService userDetailsService(DataSource dataSource) {
        return new JdbcUserDetailsManager(dataSource);
    }

    /* Creating users in memory - Should not be used on Production, only local development
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        InMemoryUserDetailsManager userDetailsService = new InMemoryUserDetailsManager();

        UserDetails user1 = User.withUsername("admin").password("1234").authorities("admin").build();
        UserDetails user2 = User.withUsername("user").password("4321").authorities("read").build();
        userDetailsService.createUser(user1);
        userDetailsService.createUser(user2);

        auth.userDetailsService(userDetailsService);
    } */

    // endregion

}
