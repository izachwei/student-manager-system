package com.wj.seven.common.domain;

public class Student {
    private String studentId;

    private String studentName;

    private Integer studentSex;

    private String studentScore;

    private String studentSchool;

    private String studentProfession;

    private String studentDirection;

    private String studentPhone;

    private String studentEmail;

    private String studentNum;

    private String studentAdress;

    private String studentRemark;

    private String studentClazzName;

    private String studentClazzId;

    private String studentGroupId;

    private Integer studentStatus;

    private String studentRemark1;

    private User studentUser;

    private Group studentGroup;


    public Group getStudentGroup() {
        return studentGroup;
    }

    public void setStudentGroup(Group studentGroup) {
        this.studentGroup = studentGroup;
    }

    public User getStudentUser() {
        return studentUser;
    }

    public void setStudentUser(User studentUser) {
        this.studentUser = studentUser;
    }

    public Student() {
    }

    public Student(String studentId, String studentName, Integer studentSex, String studentSchool, String studentProfession, String studentDirection, String studentPhone, String studentNum, String studentClazzName, String studentClazzId) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentSex = studentSex;
        this.studentSchool = studentSchool;
        this.studentProfession = studentProfession;
        this.studentDirection = studentDirection;
        this.studentPhone = studentPhone;
        this.studentNum = studentNum;
        this.studentClazzName = studentClazzName;
        this.studentClazzId = studentClazzId;
    }

    public Student(String studentId, String studentName, Integer studentSex, String studentScore, String studentSchool, String studentProfession, String studentDirection, String studentPhone, String studentEmail, String studentNum, String studentAdress, String studentRemark, String studentClazzName, String studentClazzId, String studentGroupId, Integer studentStatus, String studentRemark1) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentSex = studentSex;
        this.studentScore = studentScore;
        this.studentSchool = studentSchool;
        this.studentProfession = studentProfession;
        this.studentDirection = studentDirection;
        this.studentPhone = studentPhone;
        this.studentEmail = studentEmail;
        this.studentNum = studentNum;
        this.studentAdress = studentAdress;
        this.studentRemark = studentRemark;
        this.studentClazzName = studentClazzName;
        this.studentClazzId = studentClazzId;
        this.studentGroupId = studentGroupId;
        this.studentStatus = studentStatus;
        this.studentRemark1 = studentRemark1;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName == null ? null : studentName.trim();
    }

    public Integer getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(Integer studentSex) {
        this.studentSex = studentSex;
    }

    public String getStudentScore() {
        return studentScore;
    }

    public void setStudentScore(String studentScore) {
        this.studentScore = studentScore == null ? null : studentScore.trim();
    }

    public String getStudentSchool() {
        return studentSchool;
    }

    public void setStudentSchool(String studentSchool) {
        this.studentSchool = studentSchool == null ? null : studentSchool.trim();
    }

    public String getStudentProfession() {
        return studentProfession;
    }

    public void setStudentProfession(String studentProfession) {
        this.studentProfession = studentProfession == null ? null : studentProfession.trim();
    }

    public String getStudentDirection() {
        return studentDirection;
    }

    public void setStudentDirection(String studentDirection) {
        this.studentDirection = studentDirection == null ? null : studentDirection.trim();
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone == null ? null : studentPhone.trim();
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail == null ? null : studentEmail.trim();
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum == null ? null : studentNum.trim();
    }

    public String getStudentAdress() {
        return studentAdress;
    }

    public void setStudentAdress(String studentAdress) {
        this.studentAdress = studentAdress == null ? null : studentAdress.trim();
    }

    public String getStudentRemark() {
        return studentRemark;
    }

    public void setStudentRemark(String studentRemark) {
        this.studentRemark = studentRemark == null ? null : studentRemark.trim();
    }

    public String getStudentClazzName() {
        return studentClazzName;
    }

    public void setStudentClazzName(String studentClazzName) {
        this.studentClazzName = studentClazzName == null ? null : studentClazzName.trim();
    }

    public String getStudentClazzId() {
        return studentClazzId;
    }

    public void setStudentClazzId(String studentClazzId) {
        this.studentClazzId = studentClazzId == null ? null : studentClazzId.trim();
    }

    public String getStudentGroupId() {
        return studentGroupId;
    }

    public void setStudentGroupId(String studentGroupId) {
        this.studentGroupId = studentGroupId == null ? null : studentGroupId.trim();
    }

    public Integer getStudentStatus() {
        return studentStatus;
    }

    public void setStudentStatus(Integer studentStatus) {
        this.studentStatus = studentStatus;
    }

    public String getStudentRemark1() {
        return studentRemark1;
    }

    public void setStudentRemark1(String studentRemark1) {
        this.studentRemark1 = studentRemark1 == null ? null : studentRemark1.trim();
    }

    @Override
    public String toString() {
        return "Student{" +
                "studentId='" + studentId + '\'' +
                ", studentName='" + studentName + '\'' +
                ", studentSex=" + studentSex +
                ", studentScore='" + studentScore + '\'' +
                ", studentSchool='" + studentSchool + '\'' +
                ", studentProfession='" + studentProfession + '\'' +
                ", studentDirection='" + studentDirection + '\'' +
                ", studentPhone='" + studentPhone + '\'' +
                ", studentEmail='" + studentEmail + '\'' +
                ", studentNum='" + studentNum + '\'' +
                ", studentAdress='" + studentAdress + '\'' +
                ", studentRemark='" + studentRemark + '\'' +
                ", studentClazzName='" + studentClazzName + '\'' +
                ", studentClazzId='" + studentClazzId + '\'' +
                ", studentGroupId='" + studentGroupId + '\'' +
                ", studentStatus=" + studentStatus +
                ", studentRemark1='" + studentRemark1 + '\'' +
                ", studentUser=" + studentUser +
                '}';
    }
}