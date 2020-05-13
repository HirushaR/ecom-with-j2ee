package com.example.eshop.config;

import com.example.eshop.model.MyUserDetails;
import com.example.eshop.model.User;
import com.example.eshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;



    @Override
    public UserDetails loadUserByUsername(String user_name) throws UsernameNotFoundException {
      Optional<User> user = userRepository.findByUserName(user_name);

      user.orElseThrow(() -> new UsernameNotFoundException("Not Found:"+user_name));



      return user.map(MyUserDetails::new).get();
    }
}
