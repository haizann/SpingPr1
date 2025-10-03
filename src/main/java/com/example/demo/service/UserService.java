package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.repository.UserRepository;
import com.example.demo.domain.User;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello() {
        return "hello from user service";
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public List<User> handleGetAllUsers() {
        return this.userRepository.findAll();
    }

    public void handleDeleteUser(Long id) {
        this.userRepository.deleteById(id);
    }

    public User handleGetUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

    public User handleUpdateUser(User user) {
        return this.userRepository.save(user);
    }

}
