package com.example.eshop.controller;

import com.example.eshop.model.Product;
import com.example.eshop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

//  @Controller
public class Controller {

    @Autowired
    private ProductRepository productRepository;
    private Object Product;
    private Object List;

//    @RequestMapping("/get")
//    public List<Product> getpr()
//    {
//
//        return productRepository.findByPriceLessThan(10000);
//    }
}
