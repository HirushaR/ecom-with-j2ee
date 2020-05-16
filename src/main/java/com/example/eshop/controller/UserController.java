package com.example.eshop.controller;

import com.example.eshop.model.Product;
import com.example.eshop.model.Role;
import com.example.eshop.model.User;
import com.example.eshop.repository.ProductRepository;
import com.example.eshop.repository.RoleRepository;
import com.example.eshop.repository.TagRepository;
import com.example.eshop.repository.UserRepository;
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

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

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


    @RequestMapping(value= {"/", "/login"}, method=RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView model = new ModelAndView();

        model.setViewName("user/login");
        return model;
    }

    @RequestMapping(value= {"/signup"}, method=RequestMethod.GET)
    public ModelAndView signup() {
        ModelAndView model = new ModelAndView();
        User user = new User();
        model.addObject("user", user);
        model.setViewName("user/signup");

        return model;
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
            model.setViewName("user/signup");
        }

        return model;
    }

//    @RequestMapping(value= {"/home/home"}, method=RequestMethod.GET)
//    public ModelAndView home() {
//        ModelAndView model = new ModelAndView();
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        User user = userService.findUserByEmail(auth.getName());
//
//        model.addObject("userName", user.getFirstname());
//
//
//        model.setViewName("home/home");
//        return model;
//    }

    //@RequestMapping(value= {"/home/home"}, method=RequestMethod.GET)
    @GetMapping("/home")
    public String homeZX(Model model) {
      //  ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());

        List<Product> productList = productRepository.findAll();
        List<Product> phoneList = productRepository.findTop3ByCategory("phone");
        List<Product> LaptopList = productRepository.findTop3ByCategory("laptop");
        List<Product> ardunoList = productRepository.findTop3ByCategory("a");
        model.addAttribute("ards", ardunoList);
        model.addAttribute("laptops", LaptopList);
        model.addAttribute("phones", phoneList);
        model.addAttribute("products", productList);

        //model.addObject("userName", user.getFirstname());
        model.addAttribute("user", user);
        //model.setViewName("home/home");
        return "home";
    }


    @RequestMapping(value= {"/access_denied"}, method=RequestMethod.GET)
    public ModelAndView accessDenied() {
        ModelAndView model = new ModelAndView();
        model.setViewName("errors/access_denied");
        return model;
    }

    @GetMapping("/profile")
    public String getUser(Model model, HttpServletRequest request)
    {
        int id = Integer.parseInt(request.getParameter("id"));
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        User user = userService.findUserByEmail(auth.getName());
        User user = userRepository.findById(id);
        model.addAttribute("user",user);
        return "profile";
    }

    @GetMapping("/seller/{id}")
    public String convertToSeller(Model model, @PathVariable int id)
    {
        User user = userRepository.findById(id);
        Role userRole = roleRepository.findByRole("SELLER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
        return "home";
    }



}
