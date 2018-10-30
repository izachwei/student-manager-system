package com.wj.seven.service.impl;

import com.wj.seven.common.domain.Engineer;

import com.wj.seven.common.domain.User;
import com.wj.seven.common.util.IdGenerator;
import com.wj.seven.dao.EngineerMapper;

import com.wj.seven.dao.UserMapper;
import com.wj.seven.service.EngineerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = false,propagation = Propagation.REQUIRED)
public class EngineerServiceImpl implements EngineerService {

    @Autowired
    private EngineerMapper engineerMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public List<Engineer> findAll() {
        return engineerMapper.findAll();
    }

    @Override
    public void addEngineer(Engineer engineer) {
        engineerMapper.insert(engineer);
        User user = new User();
        user.setUserId(IdGenerator.uuid());
        user.setUserName(engineer.getengineerName());
        user.setUserPwd("123456");
        user.setUserLevel(1);
        userMapper.insert(user);
    }

    @Override
    public void deleteEngineer(Engineer engineer) {

    }

    @Override
    public void updateEnginner(Engineer engineer) {
        engineerMapper.updateByPrimaryKey(engineer);
    }
}
