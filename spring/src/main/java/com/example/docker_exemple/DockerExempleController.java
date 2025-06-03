package com.example.docker_exemple;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1")
public class DockerExempleController {

    @GetMapping("/hello")
    public String getHello() {
        return "GET OK";
    }
}