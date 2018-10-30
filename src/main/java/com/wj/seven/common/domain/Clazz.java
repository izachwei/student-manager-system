package com.wj.seven.common.domain;

import com.wj.seven.common.util.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Clazz {
    private String clazzId;

    private String clazzName;

    private Integer clazzStuCount = 0;

    private String clazzDirection;

    private String createTime ;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date clazzCreateTime;

    private String startTime ;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date clazzStartTime;

    private String endTime ;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date clazzEndTime;

    private Integer clazzGroupNum = 0;

    private Integer clazzStatus = 1;

    private String clazzClazzRemark;

    private String clazzEngineerId;

    private String clazzEngineerName;


    public String getClazzEngineerName() {
        return clazzEngineerName;
    }

    public void setClazzEngineerName(String clazzEngineerName) {
        this.clazzEngineerName = clazzEngineerName;
    }

    public String getCreateTimeTxt() {
        return DateUtil.parseDateToStr(clazzCreateTime,DateUtil.DATE_FORMAT_YYYY_MM_DD);
    }

    public String getStartTimeTxt() {
        return DateUtil.parseDateToStr(clazzStartTime,DateUtil.DATE_FORMAT_YYYY_MM_DD);
    }

    public String getEndTimeTxt() {
        return DateUtil.parseDateToStr(clazzEndTime,DateUtil.DATE_FORMAT_YYYY_MM_DD);

    }

    public String getClazzId() {
        return clazzId;
    }

    public void setClazzId(String clazzId) {
        this.clazzId = clazzId == null ? null : clazzId.trim();
    }

    public String getClazzName() {
        return clazzName;
    }

    public void setClazzName(String clazzName) {
        this.clazzName = clazzName == null ? null : clazzName.trim();
    }

    public Integer getClazzStuCount() {
        return clazzStuCount;
    }

    public void setClazzStuCount(Integer clazzStuCount) {
        this.clazzStuCount = clazzStuCount;
    }

    public String getClazzDirection() {
        return clazzDirection;
    }

    public void setClazzDirection(String clazzDirection) {
        this.clazzDirection = clazzDirection == null ? null : clazzDirection.trim();
    }

    public Date getClazzCreateTime() {
        return clazzCreateTime;
    }

    public void setClazzCreateTime(Date clazzCreateTime) {
        this.clazzCreateTime = clazzCreateTime;
    }

    public Date getClazzStartTime() {
        return clazzStartTime;
    }

    public void setClazzStartTime(Date clazzStartTime) {
        this.clazzStartTime = clazzStartTime;
    }

    public Date getClazzEndTime() {
        return clazzEndTime;
    }

    public void setClazzEndTime(Date clazzEndTime) {
        this.clazzEndTime = clazzEndTime;
    }

    public Integer getClazzGroupNum() {
        return clazzGroupNum;
    }

    public void setClazzGroupNum(Integer clazzGroupNum) {
        this.clazzGroupNum = clazzGroupNum;
    }

    public Integer getClazzStatus() {
        return clazzStatus;
    }

    public void setClazzStatus(Integer clazzStatus) {
        this.clazzStatus = clazzStatus;
    }

    public String getClazzClazzRemark() {
        return clazzClazzRemark;
    }

    public void setClazzClazzRemark(String clazzClazzRemark) {
        this.clazzClazzRemark = clazzClazzRemark == null ? null : clazzClazzRemark.trim();
    }

    public String getClazzEngineerId() {
        return clazzEngineerId;
    }

    public void setClazzEngineerId(String clazzEngineerId) {
        this.clazzEngineerId = clazzEngineerId == null ? null : clazzEngineerId.trim();
    }

    @Override
    public String toString() {
        return "Clazz{" +
                "clazzId='" + clazzId + '\'' +
                ", clazzName='" + clazzName + '\'' +
                ", clazzStuCount=" + clazzStuCount +
                ", clazzDirection='" + clazzDirection + '\'' +
                ", createTime='" + createTime + '\'' +
                ", clazzCreateTime=" + clazzCreateTime +
                ", startTime='" + startTime + '\'' +
                ", clazzStartTime=" + clazzStartTime +
                ", endTime='" + endTime + '\'' +
                ", clazzEndTime=" + clazzEndTime +
                ", clazzGroupNum=" + clazzGroupNum +
                ", clazzStatus=" + clazzStatus +
                ", clazzClazzRemark='" + clazzClazzRemark + '\'' +
                ", clazzEngineerId='" + clazzEngineerId + '\'' +
                '}';
    }
}