package com.wj.seven.common.domain;

public class Engineer {
    private String engineerId;

    private String engineerName;

    private Integer engineerStatus;

    private String engineerRemarks1;

    private String engineerRemarks2;

    public String getengineerId() {
        return engineerId;
    }

    public void setengineerId(String engineerId) {
        this.engineerId = engineerId == null ? null : engineerId.trim();
    }

    public String getengineerName() {
        return engineerName;
    }

    public void setengineerName(String engineerName) {
        this.engineerName = engineerName == null ? null : engineerName.trim();
    }

    public Integer getengineerStatus() {
        return engineerStatus;
    }

    public void setengineerStatus(Integer engineerStatus) {
        this.engineerStatus = engineerStatus;
    }

    public String getengineerRemarks1() {
        return engineerRemarks1;
    }

    public void setengineerRemarks1(String engineerRemarks1) {
        this.engineerRemarks1 = engineerRemarks1 == null ? null : engineerRemarks1.trim();
    }

    public String getengineerRemarks2() {
        return engineerRemarks2;
    }

    public void setengineerRemarks2(String engineerRemarks2) {
        this.engineerRemarks2 = engineerRemarks2 == null ? null : engineerRemarks2.trim();
    }

    @Override
    public String toString() {
        return "engineer{" +
                "engineerId='" + engineerId + '\'' +
                ", engineerName='" + engineerName + '\'' +
                ", engineerStatus=" + engineerStatus +
                ", engineerRemarks1='" + engineerRemarks1 + '\'' +
                ", engineerRemarks2='" + engineerRemarks2 + '\'' +
                '}';
    }
}