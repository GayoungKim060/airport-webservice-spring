package co.yeast.bean;

import org.apache.ibatis.jdbc.Null;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import java.util.Optional;


public class AirlineVO {
    private int id;
    private Date takeoffDate;     // java.sql.Date는 String 타입
    private String airline;
    private String flightName;
    private String flightNum;
    private String dest;
//    @DateTimeFormat(pattern = "HH:mm")
    private Time takeoffTime;     // LocalTime은 자바 타입이고, Mybatis와 연동할때는 Sql타입으로 해줘야함
    private String gateAlpha;
    private String gateNum;
//    @Nullable     // 대신 Optional로 사용가능
//    @DateTimeFormat(pattern = "HH:mm")
    private Time takeoffTimeNew;  // Optional을 필드에 사용하기 보다 다음에는 null을 대입할 수 있는 timestamp로 사용하자
                                            // input form 데이터 매핑도 따로 설정해줘야함...너무 복잡해...
    private String remark;
    private String managerTel;
    private String note;
    private Timestamp regdate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTakeoffDate() {
        return takeoffDate;
    }

    public void setTakeoffDate(Date takeoffDate) {      // mybatis가 데이터베이스의 데이터와 mapping 시켜줌
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

    public Time getTakeoffTime() {        // 값이 항상 있기때문에 optional 처리 안해도됨
        /*
        if (takeoffTime != null) {
            // Format Time to HH:mm
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
            return sdf.format(takeoffTime);
        }
        return null;    // 또는 다른 기본값을 반환하거나 예외 처리를 수행할 수 있음
        * */

        return this.takeoffTime;
    }

    public void setTakeoffTime(String takeoffTime) {        // front에서 받아오는 문자열은 String으로 받아옴
        // 필수 필드로 validation check는 javascript로 하기. 항상 넘어오는 값이 존재해야함

        // <input type="time">은 HH:MM 형식으로 저장되지만
        // DB time 형식인 HH:MM:SS 맞춰줘야함

//        this.takeoffTime =
//                Optional.ofNullable(takeoffTime).orElse(null);
        this.takeoffTime = Time.valueOf(takeoffTime);
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

    public Optional<Time> getTakeoffTimeNew() {
        /*
        if (takeoffTimeNew != null) {
            // Format Time to HH:mm
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
            return sdf.format(takeoffTimeNew);
        }
        return null;    // 또는 다른 기본값을 반환하거나 예외 처리를 수행할 수 있음

        * */

        return Optional.ofNullable(takeoffTimeNew);
    }

    public void setTakeoffTimeNew(String takeoffTimeNew) {        // front에서 받아오는 문자열은 String으로 받아옴
        // <input type="time"> 선택하지 않으면 null이 아닌 빈문자열("")이 넘어옴? null값이 set되는 이유는 mybatis가 자동으로 셋팅
        // null, "" , " " 구분

        // takeoffTimeNew가 NULL이면 Optional을 사용하여 null을 저장
//        this.takeoffTimeNew =
//                Optional.ofNullable(takeoffTimeNew).orElse(null);
        // DB에서 읽어온 값이 null 이 아니거나, 사용자가 아무것도 입력하지 않았을때 경우나 아닌 경우는 값이 존재
        if(takeoffTimeNew != null && !takeoffTimeNew.equals("")) {      // 사용자가 아무 선택안하면 빈문자열이 들어오는데 그걸 생각을 못하고 하루를 버렸네ㅋㅋㅋ
            this.takeoffTimeNew = Time.valueOf(takeoffTimeNew);
        }else{
            this.takeoffTimeNew = null;     // DB에서 불러올때 NULL값으로 셋팅 되어 있는 경우, 사용자가 시간을 선택하지 않았을 경우
        }
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Optional<String> getManagerTel() {
        return Optional.ofNullable(managerTel);
    }

    public void setManagerTel(String managerTel) {
        if(managerTel != null && !managerTel.equals("")) {      // 사용자가 아무 선택안하면 빈문자열이 들어오는데 그걸 생각을 못하고 하루를 버렸네ㅋㅋㅋ
            this.managerTel = managerTel;
        }else{
            this.managerTel = null;     // DB에서 불러올때 NULL값으로 셋팅 되어 있는 경우, 사용자가 시간을 선택하지 않았을 경우
        }
    }

    public Optional<String> getNote() {
        return Optional.ofNullable(note);
    }

    public void setNote(String note) {
        if(note != null && !note.equals("")) {      // 사용자가 아무 선택안하면 빈문자열이 들어오는데 그걸 생각을 못하고 하루를 버렸네ㅋㅋㅋ
            this.note = note;
        }else{
            this.note = null;     // DB에서 불러올때 NULL값으로 셋팅 되어 있는 경우, 사용자가 시간을 선택하지 않았을 경우
        }
    }

    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }
}
