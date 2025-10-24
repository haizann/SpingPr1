package com.example.demo.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.domain.Role;
import com.example.demo.domain.User;
import com.example.demo.service.RoleService;
import com.example.demo.service.UploadService;
import com.example.demo.service.UserService;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    private final UserService userService;
    private final RoleService roleService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, RoleService roleService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/admin/user")
    public String getAdminPage(Model model) {
        model.addAttribute("newUser", new User());
        this.userService.handleGetAllUsers().forEach(u -> System.out.println(u));
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create")
    public String getCreateUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUser(@ModelAttribute("newUser") @Valid User user,
            BindingResult newUserBindingResult,
            @RequestParam("avatarFile") MultipartFile file,
            Model model) {

        // validate: kiểm tra hợp lệ
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>" + error.getField() + "-" + error.getDefaultMessage());
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        // hash password
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);

        // lưu url avatar
        String avatar = this.uploadService.handleSaveUploadfile(file, "avatar");
        user.setAvatar(avatar);

        // lấy role id
        String nameRole = user.getRole().getName();
        Role roleUser = this.roleService.handleGetRoleByName(nameRole);
        user.setRole(roleUser);

        this.userService.handleSaveUser(user);

        return "redirect:/admin/user/home";
    }

    @RequestMapping("admin/user/home")
    public String getHomeString(Model model) {
        model.addAttribute("allUsers", this.userService.handleGetAllUsers());
        return "admin/user/home";
    }

    @RequestMapping(value = "/admin/user/delete", method = RequestMethod.POST)
    public String deleteUser(@RequestParam("userId") Long userId, Model model) {
        this.userService.handleDeleteUser(userId);
        return "redirect:/admin/user/home";
    }

    @RequestMapping("/admin/user/view/{id}")
    public String getViewUser(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", this.userService.handleGetUserById(id));
        return "admin/user/view";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUser(@PathVariable("id") Long id, Model model) {
        User user = this.userService.handleGetUserById(id);
        if (user.getRole() == null) {
            user.setRole(new Role());
        }
        model.addAttribute("user", this.userService.handleGetUserById(id));
        model.addAttribute("roles", this.roleService.handleGetAllRole());
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(@ModelAttribute("user") @Valid User user, BindingResult result, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("roles", this.roleService.handleGetAllRole());
            return "admin/user/update";
        }

        User currentUser = userService.handleGetUserById(user.getId());
        if (currentUser != null) {
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            currentUser.setAddress(user.getAddress());

            if (user.getRole() != null && user.getRole().getId() != null) {
                currentUser.setRole(roleService.handleGetRoleById(user.getRole().getId()));
            }

            userService.handleSaveUser(currentUser);
        }

        return "redirect:/admin/user/home";
    }

}
