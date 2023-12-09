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
        String sql = "insert into airline(takeoffDate, airline, flightName, flightNum, dest, takeoffTime, gateAlpha, gateNum, takeoffTimeNew, remark, managerTel, note) values ("
                + "'" + vo.getTakeoffDate() +"',"
                + "'" + vo.getAirline() +"',"
                + "'" + vo.getFlightName() +"',"
                + "'" + vo.getFlightNum() +"',"
                + "'" + vo.getDest() +"',"
                + "'" + vo.getTakeoffTime() +"',"
                + "'" + vo.getGateAlpha() +"',"
                + "'" + vo.getGateNum() +"',"
                + "'" + vo.getTakeoffTimeNew() +"',"
                + "'" + vo.getRemark() +"',"
                + "'" + vo.getManagerTel() +"',"
                + "'" + vo.getNote() +"')";
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
