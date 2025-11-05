package com.example.calculator;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CalculatorController {

    @GetMapping("/add")
    public String add(@RequestParam int x, @RequestParam int y) {
        return "Result = " + (x + y);
    }

    @GetMapping("/sub")
    public String sub(@RequestParam int x, @RequestParam int y) {
        return "Result = " + (x - y);
    }
}
