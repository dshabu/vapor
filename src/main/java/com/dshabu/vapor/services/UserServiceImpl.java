package com.dshabu.vapor.services;

import com.dshabu.vapor.models.Roles;
import com.dshabu.vapor.models.User;
import com.dshabu.vapor.repositories.RolesRepository;
import com.dshabu.vapor.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RolesRepository rolesRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setUserPassword(bCryptPasswordEncoder.encode(user.getUserPassword()));
        Optional<Roles> regularUserRole = rolesRepository.findByRoleName("ROLE_USER");

        if (regularUserRole.isPresent()) {
            user.setRoles(Collections.singleton(regularUserRole.get()));
        }

        userRepository.save(user);
    }

    @Override
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUserUsername(username);
    }
}
