package co.yeast.dao;

import co.yeast.bean.AirlineVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AirlineDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int insertAirline(AirlineVO vo) {
        System.out.println("===> JDBC로 insertAirline() 기능 처리");

        // 입력되지 않은 값은 database에 null 값으로 셋팅해주기 위한 변수처리
        String takeoffTimeNew = vo.getTakeoffTimeNew() != null ? "'" + vo.getTakeoffTimeNew() + "'" : null;
        String managerTel = !vo.getManagerTel().isEmpty() ? "'" + vo.getManagerTel() + "'" : null;
        String note = !vo.getNote().isEmpty() ? "'" + vo.getNote() + "'" : null;

        String sql = "insert into airline(takeoffDate, airline, flightName, flightNum, dest, takeoffTime, gateAlpha, gateNum, takeoffTimeNew, remark, managerTel, note) values ("
                + "'" + vo.getTakeoffDate() +"',"
                + "'" + vo.getAirline() +"',"
                + "'" + convertFlightName(vo.getAirline()) +"',"
                + "'" + vo.getFlightNum() +"',"
                + "'" + vo.getDest() +"',"
                + "'" + vo.getTakeoffTime() +"',"   // mariadb time format HH:MM:SS
                + "'" + vo.getGateAlpha() +"',"
                + "'" + vo.getGateNum() +"',"
                // type=time을 선택했을때 빈 문자열이 전달되고 AirlineVO의 setter에서 :00 문자열로 셋팅된다. 따라서 선택 안했을 경우는 ":00" 으로 셋팅됨
                + takeoffTimeNew + ","
                + "'" + vo.getRemark() +"',"
                + managerTel +","
                + note +")";
        return jdbcTemplate.update(sql);
    }
    private String convertFlightName(String airline){
        if(airline.equals("Delta")) return "DA";
        else if(airline.equals("Qatar")) return "QA";
        else if(airline.equals("Asiana")) return "AA";
        else if(airline.equals("Korean")) return "KA";
        else return "AIR";
    }

    public int updateAirline(AirlineVO vo) {
        System.out.println("===> JDBC로 updateAirline() 기능 처리");
        String takeoffTimeNew = vo.getTakeoffTimeNew() != null ? "'" + vo.getTakeoffTimeNew() + "'" : "null";
        String managerTel = !vo.getManagerTel().isEmpty() ? "'" + vo.getManagerTel() + "'" : null;
        String note = !vo.getNote().isEmpty() ? "'" + vo.getNote() + "'" : null;

        String sql = "update airline set airline='" + vo.getAirline() + "',"
                + " flightName='" + convertFlightName(vo.getAirline()) + "',"
                + " flightNum='" + vo.getFlightNum() + "',"
                + " dest='" + vo.getDest() + "',"
                + " takeoffTime='" + vo.getTakeoffTime() + "',"
                + " gateAlpha='" + vo.getGateAlpha() + "',"
                + " gateNum='" + vo.getGateNum() + "',"
                + " takeoffTimeNew=" + takeoffTimeNew + ","
                + " remark='" + vo.getRemark() + "',"
                + " managerTel=" + managerTel + ","
                + " note= " + note + " where id=" + vo.getId();
        return jdbcTemplate.update(sql);
    }

    public int deleteAirline(int id) {
        System.out.println("===> JDBC로 deleteAirline() 기능 처리");
        String sql = "delete from airline where id = " + id;
        return jdbcTemplate.update(sql);
    }

    public AirlineVO getAirline(int seq) {
        String sql = "select * from airline where id=" + seq;
        return jdbcTemplate.queryForObject(sql, new AirlineRowMapper());
    }
    public List<AirlineVO> getAirlineList() {
        String sql = "select * from airline order by regdate desc";
        return jdbcTemplate.query(sql, new AirlineRowMapper());
    }

}
