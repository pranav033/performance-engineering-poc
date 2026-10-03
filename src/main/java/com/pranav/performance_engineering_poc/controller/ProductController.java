package com.pranav.performance_engineering_poc.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @GetMapping
    public List<Product> getProducts() {

        List<Product> products = new ArrayList<>();

        for (long i = 1; i <= 100; i++) {
            products.add(new Product(
                    i,
                    "Product-" + i,
                    100 + i
            ));
        }

        return products;
    }

    @GetMapping("/{id}")
    public Product getProduct(@PathVariable Long id) {

        return new Product(
                id,
                "Product-" + id,
                100 + id
        );
    }

    public record Product(
            Long id,
            String name,
            double price
    ) {
    }
}