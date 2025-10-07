package com.example.demo.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.domain.Role;
import com.example.demo.repository.RoleRepository;

@Service
public class RoleService {
    private RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role handleGetRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

}
