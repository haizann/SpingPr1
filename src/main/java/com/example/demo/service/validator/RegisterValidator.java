package com.example.demo.service.validator;

import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.RegisterDTO;
import com.example.demo.repository.UserRepository;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    private final UserRepository userRepository;

    public RegisterValidator(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        if (user == null) {
            return true; // Không validate nếu object null
        }

        boolean valid = true;

        // Xóa lỗi mặc định trước (nếu có)
        context.disableDefaultConstraintViolation();

        // Kiểm tra password trống
        if (user.getPassword() == null || user.getPassword().isBlank()) {
            context.buildConstraintViolationWithTemplate("Password cannot be empty")
                    .addPropertyNode("password")
                    .addConstraintViolation();
            valid = false;
        }

        // Kiểm tra confirm password trống
        if (user.getConfirmPassword() == null || user.getConfirmPassword().isBlank()) {
            context.buildConstraintViolationWithTemplate("Confirm password cannot be empty")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation();
            valid = false;
        }

        // Kiểm tra password khớp nhau
        if (user.getPassword() != null && user.getConfirmPassword() != null
                && !user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Passwords do not match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation();
            valid = false;
        }

        // 🧩 Kiểm tra email đã tồn tại
        if (user.getEmail() != null && userRepository.existsByEmail(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email already exists")
                    .addPropertyNode("email")
                    .addConstraintViolation();
            valid = false;
        }

        return valid;
    }
}
