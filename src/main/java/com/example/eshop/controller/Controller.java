package com.example.eshop.controller;

import com.example.eshop.model.ProductReveiw;
import com.example.eshop.repository.ProductRepository;
import com.example.eshop.repository.ProductReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    //SELECT * from product where id = (SELECT product_id FROM prod_tag WHERE tag_id = (SELECT id FROM tags WHERE name ="iphone" ))

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ProductReviewRepository productReviewRepository;



//    @RequestMapping("/get")
//    public ProductReveiw getpr()
//    {
//        //Product product = ;
//       return productReviewRepository.findByProductid(4);
//    }
}
