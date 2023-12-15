package co.yeast.dao;

import co.yeast.bean.AirlineVO;
import co.yeast.bean.SearchVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
* Service에 의해 호출되어 DB CRUD를 담당
* */
@Repository
public class AirlineDAO {

    @Autowired
    SqlSession sqlSession;

//    @Autowired
//    AirlineMapper airlineMapper;

    public int insertAirline(AirlineVO vo) {
        /*
        System.out.println("===> JDBC로 insertAirline() 기능 처리");

        // 입력되지 않은 값은 database에 null 값으로 셋팅해주기 위한 변수처리
        // jdbcType을 명시해주면 null처리가 되어 데이터베이스에 들어감
        System.out.println("takeoffTime 전 : " + vo.getTakeoffTime());
        System.out.println("takeoffTimeNew 전 : " + vo.getTakeoffTimeNew());
        System.out.println("managerTel 전 : " + vo.getManagerTel());
        System.out.println("note 전 : " + vo.getNote());

        /* mybatis 연결 전
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
        */

        vo.setFlightName(convertFlightName(vo.getAirline()));

        int count = sqlSession.insert("Airline.insertAirline", vo);
        return count;
    }
    private String convertFlightName(String airline){
        if(airline.equals("Delta")) return "DA";
        else if(airline.equals("Qatar")) return "QA";
        else if(airline.equals("Asiana")) return "AA";
        else if(airline.equals("Korean")) return "KA";
        else return "AIR";
    }

    public int updateAirline(AirlineVO vo) {
        /*
        System.out.println("===> JDBC로 updateAirline() 기능 처리");

        /*
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
        */

        System.out.println("takeoffTime(): "+ vo.getTakeoffTime());
        System.out.println("takeoffTimeNew(): "+ vo.getTakeoffTimeNew());
        vo.setFlightName(convertFlightName(vo.getAirline()));

        int count = sqlSession.update("Airline.updateAirline", vo);
        return count;
    }

    public int deleteAirline(int id) {
        /*
        System.out.println("===> JDBC로 deleteAirline() 기능 처리");
        /* mybatis 연결 전
        String sql = "delete from airline where id = " + id;
        return jdbcTemplate.update(sql);
        */

        int count = sqlSession.delete("Airline.deleteAirline", id);
        return count;
    }

    // null 값을 담기 위해 Optional로 리턴
    public AirlineVO getAirline(int id) {
        /*
        String sql = "select * from airline where id=" + seq;
        return jdbcTemplate.queryForObject(sql, new AirlineRowMapper());
        */

        AirlineVO one = sqlSession.selectOne("Airline.getAirline", id);
        return one;
    }
    public List<AirlineVO> getAirlineList() {
        /* mybatis 적용전
        String sql = "select * from airline order by regdate desc";
        return jdbcTemplate.query(sql, new AirlineRowMapper());
        */

        List<AirlineVO> list = sqlSession.selectList("Airline.getAirlineList");
        return list;
    }

    public List<AirlineVO> getRemarkList(String remark){
        List<AirlineVO> list = sqlSession.selectList("Airline.getRemarkList", remark);
        return list;
    }
    // SQL Injection 공격 방지를 위해 prepareStatement 사용하여 직접 문자열 다루기
    public List<AirlineVO> getSearchList(String searchType, String keyword){
        //  mybatis 파라미터 매핑을 위해서는 HashMap사용해야함
        Map<String, Object> params = new HashMap<>();
        params.put("searchType", searchType);
        params.put("keyword", keyword);

        List<AirlineVO> list = sqlSession.selectList("Airline.getSearchList", params);
//        List<AirlineVO> list = airlineMapper.getSearchList(searchVO);
        System.out.println("DAO >> list " + list);
        return list;

//        mybatis
//        정적 매핑 ${}: 문자열 그대로 치환
//        동적 매핑 #{}: 사용자 입력에 따른 다른값이 들어갈 수 있음
    }
}
