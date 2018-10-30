package com.wj.seven.dao;

import com.wj.seven.common.domain.Clazz;

import java.util.List;

public interface ClazzMapper {
    int deleteByPrimaryKey(String clazzId);

    int insert(Clazz record);

    int insertSelective(Clazz record);

    Clazz selectByPrimaryKey(String clazzId);

    int updateByPrimaryKeySelective(Clazz record);

    int updateByPrimaryKey(Clazz record);

    List<Clazz> findAll();
}