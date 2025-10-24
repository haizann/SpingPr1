package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.service.ProductService;
import com.example.demo.service.UploadService;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import com.example.demo.domain.Product;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        model.addAttribute("allProducts", this.productService.handleGetAllProduct());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("newProduct") @Valid Product product, BindingResult newBindingResult,
            Model model,
            @RequestParam("imageFile") MultipartFile file) {

        if (newBindingResult.hasErrors()) {
            return "/admin/product/create";
        }

        String imgProduct = this.uploadService.handleSaveUploadfile(file, "product");
        product.setImage(imgProduct);
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
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(
            @ModelAttribute("product") @Valid Product product, BindingResult newBindingResult,
            @RequestParam(value = "imageFile", required = false) MultipartFile file,
            @RequestParam(value = "removeImage", required = false, defaultValue = "false") boolean removeImage) {

        if (newBindingResult.hasErrors()) {
            return "admin/product/update";
        }

        Product currentProduct = productService.handleGetProductById(product.getId());
        if (currentProduct != null) {
            // cập nhật các field khác
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setSold(product.getSold());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());

            if (file != null && !file.isEmpty()) {
                // Nếu có file mới -> lưu file mới, ghi đè ảnh cũ
                currentProduct.setImage(uploadService.handleSaveUploadfile(file, "product"));
            } else if (removeImage) {
                // Không có file mới, nhưng yêu cầu xóa -> xóa ảnh
                currentProduct.setImage(null);
            }
            // Nếu không file mới và removeImage=false -> giữ nguyên ảnh
        }

        productService.handleSaveProduct(currentProduct);
        return "redirect:/admin/product";
    }

}
