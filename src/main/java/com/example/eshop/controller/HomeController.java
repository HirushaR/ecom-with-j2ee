package com.example.eshop.controller;

import com.example.eshop.model.Product;
import com.example.eshop.model.ProductReveiw;
import com.example.eshop.model.Tag;
import com.example.eshop.model.User;
import com.example.eshop.repository.ProductRepository;
import com.example.eshop.repository.ProductReviewRepository;
import com.example.eshop.repository.TagRepository;
import com.example.eshop.repository.UserRepository;
import com.example.eshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    private ProductReviewRepository productReviewRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private TagRepository tagRepository;
    @Autowired
    private UserRepository userRepository;


    public String auth()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        return user.getFirstname();
    }

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
//    @GetMapping("/home/home")
//    public String getLatecedProdct(Model model)
//    {
//        List<Product> productList = productRepository.findAll();
//        List<Product> phoneList = productRepository.findTop3ByCategory("phone");
//        List<Product> LaptopList = productRepository.findTop3ByCategory("laptop");
//        List<Product> ardunoList = productRepository.findTop3ByCategory("a");
//        model.addAttribute("ards", ardunoList);
//        model.addAttribute("laptops", LaptopList);
//        model.addAttribute("phones", phoneList);
//        model.addAttribute("products", productList);
//        return "home/home";
//    }

    @GetMapping("/viewproduct/{productid}")
    public String viewProductfromID(@PathVariable int productid, Model model) throws IOException {


        Optional<Product> product = productRepository.findById(productid);
        List<ProductReveiw> productReveiw = productReviewRepository.findByProductid(productid);
        int count_of_review= productReviewRepository.countByProductid(productid);

        String name = auth();
        model.addAttribute("reviews_count",count_of_review);
        model.addAttribute("reviews",productReveiw);
        model.addAttribute("userName", name);
        model.addAttribute(product.get());
        return "viewProduct";
    }

    @GetMapping("/products")
    public String viewProduct(Model model) throws IOException {
        List<Product> productList = productRepository.findAll();
        List<Tag> tagList = tagRepository.findAll();
        String name = auth();
        model.addAttribute("userName", name);
        model.addAttribute("tags",tagList);
        model.addAttribute("products",productList);
        return "products";
    }

    @PostMapping("/reveiw")
    public String getReview(Model model, @ModelAttribute ProductReveiw newproductReveiw)
    {
        String body =newproductReveiw.getBody();
        int pid = newproductReveiw.getProductid();
        User user = userRepository.findByFirstname(auth());
        int user_id = user.getId();
        Date dt = new Date();

        ProductReveiw svproductReveiw = new ProductReveiw();
        svproductReveiw.setBody(body);
        svproductReveiw.setCreate_date(dt);
        svproductReveiw.setProductid(pid);
        svproductReveiw.setUserid(user_id);
        productReviewRepository.save(svproductReveiw);


       // productReviewRepository.save(productReveiw);
        return "products";
    }







}
