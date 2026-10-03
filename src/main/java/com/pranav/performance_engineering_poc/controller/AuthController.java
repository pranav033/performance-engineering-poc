package com.pranav.performance_engineering_poc.controller;

import com.pranav.performance_engineering_poc.security.JwtService;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final JwtService jwtService;

    public AuthController(JwtService jwtService) {
        this.jwtService = jwtService;
    }

    @PostMapping("/login")
    public Map<String, String> login(
            @RequestParam String username,
            @RequestParam String password) {

        // Demo credentials for this POC.
        if (!"perfuser".equals(username) || !"perfpass".equals(password)) {
            throw new RuntimeException("Invalid username or password");
        }

        String token = jwtService.generateToken(username);

        return Map.of("accessToken", token);
    }
}