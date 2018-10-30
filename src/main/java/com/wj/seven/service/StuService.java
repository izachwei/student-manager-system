package com.wj.seven.service;



import com.wj.seven.common.domain.Student;

import java.util.List;


public interface StuService {
    public List<Student> findAllByClazzId(String clazzId);

    public void addStu(Student student);

    public void updateStu(Student student);

    public void delStu(String stuId);

    public int insertListStu(List<Student> students, String clazzId);



    public void unlockStu(Student student);

    void lockStu(Student student);

    Student findByStudentId(String studentId);
}
