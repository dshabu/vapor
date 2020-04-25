package com.dshabu.vapor.services;

import com.dshabu.vapor.models.Roles;
import com.dshabu.vapor.models.User;
import com.dshabu.vapor.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> userOpt = userRepository.findByUserUsername(username);

        if (userOpt.isEmpty()) {
            throw new UsernameNotFoundException(username);
        }

        User user = userOpt.get();

        Set<GrantedAuthority> authoritySet = new HashSet<>();
        for (Roles role : user.getRoles()) {
            authoritySet.add(new SimpleGrantedAuthority(role.getRoleName()));
        }

        return new org.springframework.security.core.userdetails.User(user.getUserUsername(), user.getUserPassword(), authoritySet);
    }
}
