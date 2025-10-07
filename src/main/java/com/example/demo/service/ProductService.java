package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.domain.Product;
import com.example.demo.repository.ProductRepository;

@Service
public class ProductService {
    private ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> handleGetAllProduct() {
        return this.productRepository.findAll();
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Product handleGetProductById(Long id) {
        return this.productRepository.findById(id).orElse(null);
    }

    public void handleDeleteProduct(Long id) {
        this.productRepository.deleteById(id);
    }

}
