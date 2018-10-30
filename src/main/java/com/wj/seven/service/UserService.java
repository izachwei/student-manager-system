package com.wj.seven.service;

import com.wj.seven.common.domain.User;
import org.springframework.stereotype.Service;

/**
 * 用户服务层接口
 */
@Service
public interface UserService {
    /**
     * 通过用户名查找用户
     * @param userName
     * @return User
     */
    public User findUserByUserName(String userName);

    /**
     * 添加用户
     * @param user
     */
    public void addUser(User user);
}
