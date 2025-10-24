package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.User;

// crud: create read update delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);

    List<User> findAll();

    void deleteById(Long id);

    User findById(long id);

    boolean existsByEmail(String email);

    List<User> findOneByEmail(String email);

    User findByEmail(String email);

}
