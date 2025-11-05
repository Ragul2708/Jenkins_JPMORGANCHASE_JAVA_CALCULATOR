package com.example.calculator;

import org.springframework.web.bind.annotation.*;

@RestController     // ✅ Important to serve API
@RequestMapping("/calculator")
public class CalculatorController {

    @GetMapping("/add")
    public int add(@RequestParam int a, @RequestParam int b) {
        return a + b;
    }
}
