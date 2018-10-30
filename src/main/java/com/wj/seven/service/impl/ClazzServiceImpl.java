package com.wj.seven.service.impl;


import com.wj.seven.common.domain.Clazz;
import com.wj.seven.common.domain.Group;
import com.wj.seven.common.domain.Student;
import com.wj.seven.common.util.IdGenerator;
import com.wj.seven.dao.ClazzMapper;
import com.wj.seven.dao.GroupMapper;
import com.wj.seven.dao.StudentMapper;
import com.wj.seven.service.ClazzService;
import com.wj.seven.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional(rollbackFor=Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
public class ClazzServiceImpl implements ClazzService {

    @Autowired
    private ClazzMapper clazzMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private GroupMapper groupMapper;



    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public List<Clazz> findAll() {
        return clazzMapper.findAll();
    }

    @Override
    public Clazz findClazzById(String id) {
        return clazzMapper.selectByPrimaryKey(id);
    }

    @Override
    public void addClazz(Clazz clazz) {
        clazzMapper.insert(clazz);
    }

    @Override
    public void deleteClazzByClazzId(String clazzId) {
        Clazz clazz = clazzMapper.selectByPrimaryKey(clazzId);
        clazz.setClazzStatus(0);
        clazzMapper.updateByPrimaryKey(clazz);
    }

    @Override
    public void updateClazz(Clazz clazz) {
        clazzMapper.updateByPrimaryKeySelective(clazz);
    }

    @Override
    public void randomGroup(String clazzId, int groupCount) {
        //查询对应班级学员
        List<Student> students = studentMapper.selectByClazzId(clazzId);
        List<Group> groups = new ArrayList<>();
        List<Student> groupStudents = new ArrayList<>();
        int forCount =students.size()/groupCount;
        for (int i=0;i<forCount;i++){
            Collections.shuffle(students);
            Group group = new Group();
            group.setGroupId(IdGenerator.uuid());
            group.setGroupName("第"+(i+1)+"组");
            int j = 0;
            while(j<groupCount){
                int index =(int)(Math.random()*students.size());
                Student student = students.remove(index);
                student.setStudentGroupId(group.getGroupId());
                studentMapper.updateByPrimaryKeySelective(student);
                j++;
            }
            group.setGroupClazzId(clazzId);
            group.setGroupCount(j);
            groups.add(group);
        }

        /**
         * 剩余的学员 随机插入组中
         */
        if(students.size()!=0&&students.size()<groupCount){
            for (int i = 0; i <students.size() ; i++) {
                Student student = students.remove(i);
                int index =(int)(Math.random()*groups.size());
                Group group = groups.get(index);
                String groupId = group.getGroupId();
                group.setGroupCount(group.getGroupCount()+1);
                student.setStudentGroupId(groupId);
                studentMapper.updateByPrimaryKeySelective(student);
            }
        }

        Clazz clazz = clazzMapper.selectByPrimaryKey(clazzId);
        clazz.setClazzGroupNum(groups.size());
        clazzMapper.updateByPrimaryKeySelective(clazz);

        /**
         * 将 组 插入数据库
         */
        for (Group group: groups
             ) {
            groupMapper.insert(group);
        }

    }
}
