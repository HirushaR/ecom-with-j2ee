package com.example.eshop.controller;

import com.example.eshop.model.*;
import com.example.eshop.repository.*;
import com.example.eshop.service.UserService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;



import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.awt.print.Pageable;
import java.io.IOException;
import java.util.*;

@Controller
public class HomeController {

    private String getRole()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());

        String role =  userRepository.findUserRole(user.getId());
        return role;
    }

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
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    CartProductRepository cartProductRepository;
    @Autowired
    CartRepository cartRepository;

    public User auth()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        return user;
    }
    public List<CartProduct> cartDetilsForNav()
    {
        Cart cart = cartRepository.findByUser(auth());
        List<CartProduct> product = cartProductRepository.findByCart(cart);
        return product;
    }

    public List<Category> getcategory()
    {
        List<Category> category = categoryRepository.findAll();
        return category;
    }


    private Date currrent = new Date();


    @GetMapping("/viewproduct/{id}")
    public String viewProductfromID(Model model,@PathVariable int id) throws IOException {

        Optional<Product> product = productRepository.findById(id);

        List<ProductReveiw> productReveiw = productReviewRepository.findByProductid(id);
        int count_of_review= productReviewRepository.countByProductid(id);

       // String name = auth().getFirstname();
        model.addAttribute("reviews_count",count_of_review);
        model.addAttribute("reviews",productReveiw);
        model.addAttribute("user", auth());
        model.addAttribute(product.get());
        model.addAttribute("categories",getcategory());
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        return "viewProduct";
    }

    @GetMapping("/products")
    public String viewProduct(Model model) throws IOException {

        List<Product> productList = productRepository.findAll();
        List<Tag> tagList = tagRepository.findAll();


       // String name = auth();
        model.addAttribute("user", auth());
        model.addAttribute("tags",tagList);
        model.addAttribute("categories",getcategory());
        model.addAttribute("products",productList);
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        return "products";
    }


    @PostMapping("reveiw")
    public String createreview(HttpServletRequest request)
    {

        ProductReveiw productReveiw = new ProductReveiw();
        Date dt = new Date();
        int pid = Integer.parseInt(request.getParameter("productid"));
        int uid = Integer.parseInt(request.getParameter("userid"));
        productReveiw.setUserid(uid);
        productReveiw.setProductid(pid);
        productReveiw.setBody(request.getParameter("body").trim());
        productReveiw.setCreate_date(dt);
        productReviewRepository.save(productReveiw);

        return "viewProduct";
    }

    @GetMapping("/seller/addproduct")
    public String addProduct(Model model)
    {
        List<Product> productList = productRepository.findAll();
        model.addAttribute("roles",getRole());
        model.addAttribute("products",productList);
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("user", auth());
        model.addAttribute("categories",getcategory());
        //return to addProduct jsp page
        return "addProduct";
    }


    @PostMapping("/createproduct")
    public String createPdocuct(Model model, Product product, Tag tag,Category category)
    {

        User user = userRepository.findById(19);
        Date dt = new Date();
        model.addAttribute("roles",getRole());

        Set<Tag> tg = new HashSet<Tag>();
        tg.add(tag);


        product.setName(product.getName());
        product.setDescription(product.getDescription());
        product.setDetails(product.getDetails());
        product.setCategory(category);
        product.setImage(product.getImage());
        product.setPrice(product.getPrice());
        product.setQuantity(product.getQuantity());
        product.setTags(tg);
        product.setUser(user);
        product.setCreated_date(dt);
        productRepository.save(product);

        return "products";
    }


    @GetMapping("seller/myProduct")
    public String getUserProduct(Model model)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        List<Product> product = productRepository.findByUser(user);
        model.addAttribute("products",product);
        model.addAttribute("user", auth());
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("categories",getcategory());
        return "myproduct";
    }

    @PostMapping("addcartproduct")
    public String addtocart(HttpServletRequest request)
    {
        int pid = Integer.parseInt(request.getParameter("productid"));
        int qunt =Integer.parseInt(request.getParameter("quantity"));
        Optional<Product> product = productRepository.findById(pid);

        //quantity
//            int id = auth().getId();

            double tot = product.get().getPrice() * qunt;
            Cart cart = cartRepository.findByUser(auth());
            CartProduct cartProduct = new CartProduct();
            cartProduct.setCart(cart);
            cartProduct.setProduct(product.get());
            cartProduct.setQuantity(qunt);
            cartProduct.setCreatedDate(currrent);
            cartProductRepository.save(cartProduct);

            return "cart";
    }
//
    @GetMapping("/cart")
    public String getcart(Model model)
    {
//
//        Cart cart = cartRepository.findByUser(auth());
      // List<CartProduct> cartProduct = cartProductRepository.findByCart(cart);
      //  Product product = productRepository.findCartProduct(19);
//        List<CartProduct> product = cartProductRepository.findByCart(cart);
//        model.addAttribute("cartNav",cart());
        model.addAttribute("user", auth());
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("categories",getcategory());
        return "cart";
    }

    @GetMapping("/products/{id}")
    public String viewProductByCategory(Model model,@PathVariable int id) throws IOException {
        Category category1 = categoryRepository.findById(id);
        List<Product> productList = productRepository.findAllByCategory(category1);
        List<Tag> tagList = tagRepository.findAll();
        List<Category> category = categoryRepository.findAll();

        model.addAttribute("user", auth());
        model.addAttribute("tags",tagList);
        model.addAttribute("categories",category);
        model.addAttribute("products",productList);
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("categories",getcategory());
        return "products";
    }
    @GetMapping("/search")
    public String getSearch(HttpServletRequest request,Model model)
    {
        String search = request.getParameter("search");
        List<Tag> tagList = tagRepository.findAll();
        List<Category> category = categoryRepository.findAll();

        List<Product> productList = productRepository.findAllByNameContains(search);

        model.addAttribute("user", auth());
        model.addAttribute("tags",tagList);
        model.addAttribute("categories",category);
        model.addAttribute("products",productList);
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("categories",getcategory());
        return "products";
    }

    @GetMapping("admin/allUser")
    public String getAllUsers(Model model)
    {
        List<User> user = userRepository.findAll();

        model.addAttribute("user", auth());
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("allusers",user);
        model.addAttribute("categories",getcategory());
        return "admin/allusers";
    }

    @GetMapping("admin/allProduct")
    public String getAllProduct(Model model)
    {
       List<Product> product = productRepository.findAll();

        model.addAttribute("user", auth());
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("products",product);
        model.addAttribute("categories",getcategory());
        return "admin/allproducts";
    }


}
