package com.example.eshop.controller;

import com.example.eshop.model.*;
import com.example.eshop.repository.*;
import com.example.eshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Controller
public class UserController {



    @Autowired
    RoleRepository roleRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private TagRepository tagRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private CartProductRepository cartProductRepository;
    @Autowired
    private CartRepository cartRepository;

    public User auth()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        return user;
    }
    public String getRole()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());

        String role =  userRepository.findUserRole(user.getId());
        return role;
    }
    public List<Category> getcategory()
    {
        List<Category> category = categoryRepository.findAll();
        return category;

    }




    public List<CartProduct> cartDetilsForNav()
    {
        Cart cart = cartRepository.findByUser(auth());
        List<CartProduct> product = cartProductRepository.findByCart(cart);
        return product;
    }


    @RequestMapping(value= {"/", "/login"}, method=RequestMethod.GET)
    public String login(Model model) {

        return "user/login";
    }

    @RequestMapping(value= {"/signup"}, method=RequestMethod.GET)
    public String signup(Model model) {

        User user = new User();
        model.addAttribute("user", user);
        return "user/signup";
    }

    @RequestMapping(value= {"/signup"}, method=RequestMethod.POST)
    public ModelAndView createUser(@Valid User user, BindingResult bindingResult) {
        ModelAndView model = new ModelAndView();
        User userExists = userService.findUserByEmail(user.getEmail());

        if(userExists != null) {
            bindingResult.rejectValue("email", "error.user", "This email already exists!");
        }
        if(bindingResult.hasErrors()) {
            model.setViewName("user/signup");
        } else {
            userService.saveUser(user);
            model.addObject("msg", "User has been registered successfully!");
            model.addObject("user", new User());
            Cart cart = new Cart();
            cart.setUser(user);
            cartRepository.save(cart);
            model.setViewName("user/signup");
        }

        return model;
    }



    //@RequestMapping(value= {"/home/home"}, method=RequestMethod.GET)
    @GetMapping("/home")
    public String homeZX(Model model) {
      //  ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());

        List<Product> productList = productRepository.findAll();
        Category category1 = categoryRepository.findById(1);
        Category category2 = categoryRepository.findById(2);
        Category category3 = categoryRepository.findById(3);
        List<Product> phoneList = productRepository.findTop3ByCategory(category1);
        List<Product> LaptopList = productRepository.findTop3ByCategory(category2);
        List<Product> ardunoList = productRepository.findTop3ByCategory(category3);
        model.addAttribute("ards", ardunoList);
        model.addAttribute("laptops", LaptopList);
        model.addAttribute("phones", phoneList);
        model.addAttribute("products", productList);
        model.addAttribute("roles",getRole());
        model.addAttribute("carts", cartDetilsForNav());
        //model.addObject("userName", user.getFirstname());
        model.addAttribute("user", user);
        //model.addAttribute("category", getcategory());
        //model.setViewName("home/home");
        String role =  userRepository.findUserRole(user.getId());
        model.addAttribute("roles", role);
        model.addAttribute("categories",getcategory());

        return "home";
    }


    @RequestMapping(value= {"/access_denied"}, method=RequestMethod.GET)
    public ModelAndView accessDenied() {
        ModelAndView model = new ModelAndView();
        model.setViewName("errors/access_denied");
        return model;
    }

    @GetMapping("/profile/{id}")
    public String getUser(Model model,@PathVariable int id)
    {

        User user = userRepository.findById(id);
        model.addAttribute("user",user);
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("roles",getRole());
        model.addAttribute("user", auth());
        model.addAttribute("categories",getcategory());
        return "profile";
    }

    @GetMapping("/seller/{id}")
    public String convertToSeller(Model model, @PathVariable int id)
    {

        User user = userRepository.findById(id);
        Role userRole = roleRepository.findByRole("SELLER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        model.addAttribute("roles",getRole());
        userRepository.save(user);
        model.addAttribute("carts", cartDetilsForNav());
        model.addAttribute("user", auth());
        model.addAttribute("categories",getcategory());
        return "home";
    }



}
