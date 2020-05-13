package com.example.eshop.config;

import com.example.eshop.model.User;
import com.example.eshop.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;

@Component
public class authenticationSuccessImpl implements AuthenticationSuccessHandler {

    @Autowired
    HttpSession session; //autowiring session

    @Autowired
    UserRepository repository;

    private static final Logger logger = LoggerFactory.getLogger(authenticationSuccessImpl.class);
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        String userName = "";
        if(authentication.getPrincipal() instanceof Principal) {
            userName = ((Principal)authentication.getPrincipal()).getName();

        }else {
            userName = ((User)authentication.getPrincipal()).getUser_name();
        }
        logger.info("userName: " + userName);
        //HttpSession session = request.getSession();
        session.setAttribute("userId", userName);
        response.sendRedirect("/");
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {

    }
}
