package com.bear.book.service;

import com.bear.book.pojo.User;
import com.bear.book.service.impl.UserServiceImpl;
import org.junit.Test;


/**
 * @author Spring-_-Bear
 * @datetime 2022/2/16 20:02
 */
public class UserServiceTest {
    private final UserService userService = new UserServiceImpl();

    @Test
    public void loginUser() {
        if (userService.loginUser("admin", "admin") != null) {
            System.out.println("登录成功");
        } else {
            System.out.println("登录失败");
        }
    }

    @Test
    public void registerUser() {
        if (userService.registerUser(new User(null, "admin", "admin", "admin@admin.com"))) {
            System.out.println("注册成功");
        } else {
            System.out.println("注册失败");
        }
    }

    @Test
    public void existsUsername() {
        if (userService.existsUsername("admin")) {
            System.out.println("用户名已存在");
        } else {
            System.out.println("用户名不存在");
        }
    }
}