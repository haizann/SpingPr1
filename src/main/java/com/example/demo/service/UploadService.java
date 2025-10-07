package com.example.demo.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.Role;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadfile(MultipartFile file, String targetFolder) {
        // dan den /webapp + resources/images
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = "";
        try {
            byte[] bytes = file.getBytes();
            // File.separator là /
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists()) // nếu kh tồn tại thì make: tạo mới
                dir.mkdirs();
            // Create the file on server
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return finalName;
    }

}
