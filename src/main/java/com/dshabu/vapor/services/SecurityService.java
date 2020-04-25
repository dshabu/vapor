package com.dshabu.vapor.services;

import org.springframework.stereotype.Service;

@Service
public interface SecurityService {
    String findLoggedInUsername();
}
