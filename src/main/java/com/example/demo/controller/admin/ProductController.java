package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.service.ProductService;

import org.springframework.ui.Model;
import com.example.demo.domain.Product;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        model.addAttribute("allProducts", this.productService.handleGetAllProduct());
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("newProduct") Product product, Model model) {
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/view/{id}")
    public String getViewProduct(@PathVariable("id") long id, Model model) {
        model.addAttribute("product", this.productService.handleGetProductById(id));
        return "admin/product/view";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(@RequestParam("productId") long productId, Model model) {
        this.productService.handleDeleteProduct(productId);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProduct(@PathVariable("id") long id, Model model) {
        model.addAttribute("product", this.productService.handleGetProductById(id));
        return "/admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(@ModelAttribute("product") Product product, Model model) {
        Product currentProduct = this.productService.handleGetProductById(product.getId());
        if (currentProduct != null) {
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setImage(product.getImage());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setSold(product.getSold());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());
        }
        this.productService.handleSaveProduct(currentProduct);
        return "redirect:/admin/product";
    }

}
