package co.yeast.dao;

import co.yeast.bean.AirlineVO;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AirlineRowMapper implements RowMapper<AirlineVO> {
    @Override
    public AirlineVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        AirlineVO vo = new AirlineVO();

        vo.setId(rs.getInt("id"));
        vo.setTakeoffDate(rs.getString("takeoffDate"));
        vo.setAirline(rs.getString("airline"));
        vo.setFlightName(rs.getString("flightName"));
        vo.setFlightNum(rs.getString("flightNum"));
        vo.setDest(rs.getString("dest"));
        vo.setTakeoffTime(rs.getString("takeoffTime"));
        vo.setGateAlpha(rs.getString("gateAlpha"));
        vo.setGateNum(rs.getString("gateNum"));
        vo.setTakeoffTimeNew(rs.getString("takeoffTimeNew"));
        vo.setRemark(rs.getString("remark"));
        vo.setManagerTel(rs.getString("managerTel"));
        vo.setNote(rs.getString("note"));
        vo.setRegdate(rs.getDate("regdate"));
        return vo;
    }
}
