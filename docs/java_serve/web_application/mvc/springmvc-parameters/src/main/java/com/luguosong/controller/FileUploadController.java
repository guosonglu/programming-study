package com.luguosong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author luguosong
 */
@Controller
@RequestMapping("/fileUpload")
public class FileUploadController {

    @RequestMapping("/springMvc")
    public String springMvc(@RequestParam("fileName") MultipartFile file) {
        System.out.println(file.getName());
        System.out.println(file.getOriginalFilename());
        return "get-parameters/form";
    }
}
