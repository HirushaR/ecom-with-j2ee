package com.example.eshop.service;

import com.example.eshop.model.User;

public interface UserService {
    public User findUserByEmail(String email);

    public void saveUser(User user);




}
