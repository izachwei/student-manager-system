package com.wj.seven.common.domain;

import java.util.List;

public class Group {
    private String groupId;

    private String groupName;

    private Integer groupCount;

    private String groupLeaderId;

    private String groupLeaderName;

    private String groupProjectId;

    private String groupProjectName;

    private String groupClazzId;

    private String groupRemarks1;

    private List<Student> students;

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName == null ? null : groupName.trim();
    }

    public Integer getGroupCount() {
        return groupCount;
    }

    public void setGroupCount(Integer groupCount) {
        this.groupCount = groupCount;
    }

    public String getGroupLeaderId() {
        return groupLeaderId;
    }

    public void setGroupLeaderId(String groupLeaderId) {
        this.groupLeaderId = groupLeaderId == null ? null : groupLeaderId.trim();
    }

    public String getGroupLeaderName() {
        return groupLeaderName;
    }

    public void setGroupLeaderName(String groupLeaderName) {
        this.groupLeaderName = groupLeaderName == null ? null : groupLeaderName.trim();
    }

    public String getGroupProjectId() {
        return groupProjectId;
    }

    public void setGroupProjectId(String groupProjectId) {
        this.groupProjectId = groupProjectId == null ? null : groupProjectId.trim();
    }

    public String getGroupProjectName() {
        return groupProjectName;
    }

    public void setGroupProjectName(String groupProjectName) {
        this.groupProjectName = groupProjectName == null ? null : groupProjectName.trim();
    }

    public String getGroupClazzId() {
        return groupClazzId;
    }

    public void setGroupClazzId(String groupClazzId) {
        this.groupClazzId = groupClazzId == null ? null : groupClazzId.trim();
    }

    public String getGroupRemarks1() {
        return groupRemarks1;
    }

    public void setGroupRemarks1(String groupRemarks1) {
        this.groupRemarks1 = groupRemarks1 == null ? null : groupRemarks1.trim();
    }
}