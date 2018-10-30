package com.wj.seven.service;

import com.wj.seven.common.domain.Group;

import java.util.List;

public interface GroupService {
    public void  addGroup(Group group);

    List<Group> findGroupByClazzId(String clazzId);
}
