package com.wj.seven.service.impl;

import com.wj.seven.common.domain.Group;
import com.wj.seven.dao.GroupMapper;
import com.wj.seven.dao.StudentMapper;
import com.wj.seven.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor=Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
public class GroupServiceImpl implements GroupService {

    @Autowired
    private GroupMapper groupMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public void addGroup(Group group) {
        String groupId = group.getGroupId();
        groupMapper.insert(group);
    }

    @Override
    public List<Group> findGroupByClazzId(String clazzId) {
        return groupMapper.selectByClazzId(clazzId);
    }
}
