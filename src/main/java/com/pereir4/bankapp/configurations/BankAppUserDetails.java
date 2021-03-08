package com.pereir4.bankapp.configurations;

import com.pereir4.bankapp.models.Client;
import com.pereir4.bankapp.models.SecurityClient;
import com.pereir4.bankapp.repositories.ClientRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

// This is a custom user details service
@Service
@AllArgsConstructor
public class BankAppUserDetails implements UserDetailsService {

    private final ClientRepository clientRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<Client> client = clientRepository.findByEmail(username);

        if (client.isEmpty()) {
            throw new UsernameNotFoundException("User details not found, email: " + username);
        }

        return new SecurityClient(client.get(0));
    }

}
