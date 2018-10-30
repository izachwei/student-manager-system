package com.wj.seven.service.impl;

import com.wj.seven.common.domain.User;
import com.wj.seven.dao.UserMapper;
import com.wj.seven.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户服务层
 */
@Service

@Transactional(readOnly = false,propagation = Propagation.REQUIRED)
public class UserServiceImpl implements UserService {

    /**
     * 注入用户持久对象
     */
    @Autowired
    private UserMapper userMapper ;

    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    @Override
    public User findUserByUserName(String userName) {
        return userMapper.findUserByUserName(userName);
    }

    @Override
    public void addUser(User user) {
         userMapper.insert(user);
    }
}
