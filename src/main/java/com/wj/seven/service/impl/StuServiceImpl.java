package com.wj.seven.service.impl;


import com.wj.seven.common.domain.Clazz;
import com.wj.seven.common.domain.Student;
import com.wj.seven.common.domain.User;
import com.wj.seven.common.util.IdGenerator;
import com.wj.seven.dao.ClazzMapper;
import com.wj.seven.dao.StudentMapper;
import com.wj.seven.dao.UserMapper;
import com.wj.seven.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = false,propagation = Propagation.REQUIRED)
public class StuServiceImpl implements StuService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ClazzMapper clazzMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public List<Student> findAllByClazzId(String clazzId) {
        return  studentMapper.selectByClazzId(clazzId);
    }

    @Override
    public void addStu(Student student) {
        User user = new User();
        user.setUserId(student.getStudentId());
        user.setUserName(student.getStudentNum());
        user.setUserPwd("123456");
        user.setUserLevel(2);
        userMapper.insert(user);
        studentMapper.insert(student);
    }

    @Override
    public void updateStu(Student student) {
        studentMapper.insert(student);
    }

    @Override
    public void delStu(String stuId) {
        Student student = studentMapper.selectByPrimaryKey(stuId);
        student.setStudentStatus(0);
        studentMapper.updateByPrimaryKey(student);
    }

    @Override
    public int insertListStu(List<Student> students,String clazzId) {
        int count =  studentMapper.insertList(students);
        for (int i = 0; i <students.size() ; i++) {
            User user = new User();
            user.setUserId(students.get(i).getStudentId());
            user.setUserName(students.get(i).getStudentNum());
            user.setUserPwd("123456");
            user.setUserLevel(2);
            userMapper.insert(user);
        }
        Clazz clazz = new Clazz();
        clazz.setClazzId(clazzId);
        clazz.setClazzStuCount(count);
        clazzMapper.updateByPrimaryKeySelective(clazz);
        return  count;
    }

    @Override
    public void unlockStu(Student student) {
        User user = userMapper.selectByPrimaryKey(student.getStudentId());
        user.setUserStatus(1);
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void lockStu(Student student) {
        User user = userMapper.selectByPrimaryKey(student.getStudentId());
        user.setUserStatus(0);
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public Student findByStudentId(String studentId) {
        return studentMapper.selectByPrimaryKey(studentId);
    }
}
