package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.Product;
import com.example.demo.domain.User;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    Product save(Product product);

    List<Product> findAll();

    void deleteById(long id);

    User findById(long id);

}
