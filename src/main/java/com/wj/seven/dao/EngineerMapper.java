package com.wj.seven.dao;

import com.wj.seven.common.domain.Engineer;

import java.util.List;

public interface EngineerMapper {
    int deleteByPrimaryKey(String engineerId);

    int insert(Engineer record);

    int insertSelective(Engineer record);

    Engineer selectByPrimaryKey(String EngineerId);

    int updateByPrimaryKeySelective(Engineer record);

    int updateByPrimaryKey(Engineer record);

    List<Engineer> findAll();
}