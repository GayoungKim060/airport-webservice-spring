package co.yeast.bean;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

public class AirlineVO {
    private int id;
    private String takeoffDate;     // LocalDate
    private String airline;
    private String flightName;
    private String flightNum;
    private String dest;
    private String takeoffTime;     // LocalTime
    private String gateAlpha;
    private String gateNum;
    private String takeoffTimeNew;  // LocalTime
    private String remark;
    private String managerTel;
    private String note;
    private Date regdate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTakeoffDate() {
        return takeoffDate;
    }

    public void setTakeoffDate(String takeoffDate) {
        this.takeoffDate = takeoffDate;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public String getFlightName() {
        return flightName;
    }

    public void setFlightName(String flightName) {
        this.flightName = flightName;
    }

    public String getFlightNum() {
        return flightNum;
    }

    public void setFlightNum(String flightNum) {
        this.flightNum = flightNum;
    }

    public String getDest() {
        return dest;
    }

    public void setDest(String dest) {
        this.dest = dest;
    }

    // flightNum
    public String getTakeoffTime() {
        return takeoffTime;
    }

    public void setTakeoffTime(String takeoffTime) {
        this.takeoffTime = takeoffTime+":00";   // <input type="time">은 HH:MM 형식으로 저장되지만 DB time 형식은 HH:MM:SS
        // null일때 null:00으로 저장됨
    }

    public String getGateAlpha() {
        return gateAlpha;
    }

    public void setGateAlpha(String gateAlpha) {
        this.gateAlpha = gateAlpha;
    }

    public String getGateNum() {
        return gateNum;
    }

    public void setGateNum(String gateNum) {
        this.gateNum = gateNum;
    }

    public String getTakeoffTimeNew() {
        return takeoffTimeNew;
    }

    public void setTakeoffTimeNew(String takeoffTimeNew) {
        this.takeoffTimeNew = takeoffTimeNew+":00";   // <input type="time">은 HH:MM 형식으로 저장되지만 DB time 형식은 HH:MM:SS
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getManagerTel() {
        return managerTel;
    }

    public void setManagerTel(String managerTel) {
        this.managerTel = managerTel;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
}
