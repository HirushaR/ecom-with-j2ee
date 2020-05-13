package com.example.eshop.controller;

import com.example.eshop.model.Product;
import com.example.eshop.model.Tag;
import com.example.eshop.repository.ProductRepository;
import com.example.eshop.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private TagRepository tagRepository;

//
//    @RequestMapping("/")
//    public String getHome(HttpServletRequest request)
//    {
//        request.setAttribute("mode","MODE_ALL");
//        return "index";
//    }
    private Date currrent = new Date();

    @RequestMapping("/user")
    public String user(HttpServletRequest request)
    {
        request.setAttribute("mode","MODE_USER");
        return "index";
    }

    @RequestMapping("/admin")
    public String admin(HttpServletRequest request)
    {
        request.setAttribute("mode","MODE_ADMIN");
        return "index";
    }
    @RequestMapping("/")
    public String getLatecedProdct(Model model)
    {
        List<Product> productList = productRepository.findAll();
        List<Product> phoneList = productRepository.findTop3ByCategory("phone");
        List<Product> LaptopList = productRepository.findTop3ByCategory("laptop");
        List<Product> ardunoList = productRepository.findTop3ByCategory("a");
        model.addAttribute("ards", ardunoList);
        model.addAttribute("laptops", LaptopList);
        model.addAttribute("phones", phoneList);
        model.addAttribute("products", productList);
        return "home";
    }

    @GetMapping("/viewproduct/{productid}")
    public String viewProductfromID(@PathVariable int productid, Model model) throws IOException {
        Optional<Product> product = productRepository.findById(productid);

        model.addAttribute(product.get());
        return "viewProduct";
    }

    @GetMapping("/products")
    public String viewProduct(Model model) throws IOException {
        List<Product> productList = productRepository.findAll();
        List<Tag> tagList = tagRepository.findAll();
        model.addAttribute("tags",tagList);
        model.addAttribute("products",productList);
        return "products";
    }

    @GetMapping("/login")
    public String login()
    {
        return "login";
    }





}
