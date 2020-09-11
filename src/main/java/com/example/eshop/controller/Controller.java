package com.example.eshop.controller;

import com.example.eshop.model.Cart;
import com.example.eshop.model.CartProduct;
import com.example.eshop.model.Product;
import com.example.eshop.model.User;
import com.example.eshop.repository.CartProductRepository;
import com.example.eshop.repository.CartRepository;
import com.example.eshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
public class Controller {

    //SELECT * from product where id = (SELECT product_id FROM prod_tag WHERE tag_id = (SELECT id FROM tags WHERE name ="iphone" ))


    private UserRepository userRepository;
    private CartRepository cartRepository;
    private CartProductRepository cartProductRepository;

    @Autowired
    public Controller(UserRepository userRepository, CartRepository cartRepository, CartProductRepository cartProductRepository) {
        this.userRepository = userRepository;
        this.cartRepository = cartRepository;
        this.cartProductRepository = cartProductRepository;
    }


    //    @RequestMapping("/get")
//    public List<Product> sda()
//    {
//        User user = userRepository.findById(19);
//        Cart cart = cartRepository.findByUser(user);
//       // CartProduct product = (CartProduct) cartProductRepository.findByCart(cart);
//
//
//       return (List<Product>) product.getProduct();
//
//
//    }

}
