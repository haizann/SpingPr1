package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.domain.User;
import com.example.demo.service.UserService;

import jakarta.websocket.server.PathParam;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("eric", test);
        return "hello";
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

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(@ModelAttribute("newUser") User user, Model model) {
        System.out.println(user);
        this.userService.handleSaveUser(user);
        return this.getHomeString(model);
    }

    @RequestMapping("admin/user/home")
    public String getHomeString(Model model) {
        model.addAttribute("allUsers", this.userService.handleGetAllUsers());
        return "admin/user/home";
    }

    @RequestMapping(value = "/admin/user/delete", method = RequestMethod.POST)
    public String deleteUser(@RequestParam("userId") Long userId, Model model) {
        this.userService.handleDeleteUser(userId);
        return this.getHomeString(model);
    }

    @RequestMapping("/admin/user/view/{id}")
    public String getViewUser(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", this.userService.handleGetUserById(id));
        return "admin/user/view";
    }

    @RequestMapping(value = "/admin/user/update/{id}")
    public String getUpdateUser(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", this.userService.handleGetUserById(id));
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String UpdateUser(@ModelAttribute("user") User user, Model model) {
        User currentUser = this.userService.handleGetUserById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());

            this.userService.handleSaveUser(currentUser);
        }
        return this.getHomeString(model);
    }
}
