package com.dshabu.vapor.services;

import com.dshabu.vapor.models.User;

import java.util.Optional;

public interface UserService {
    void save(User user);
    Optional<User> findByUsername(String username);
}
