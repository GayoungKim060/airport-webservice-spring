package co.yeast.dao;

import co.yeast.bean.AirlineVO;
import co.yeast.bean.SearchVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
// mapper 인터페이스를 구현하면 자동매핑 지원 가능
//@Mapper
public interface AirlineMapper {

    int insertAirline(AirlineVO vo);
    int updateAirline(AirlineVO vo);
    int deleteAirline(AirlineVO vo);
    AirlineVO getAirline();
    List<AirlineVO>getAirlineList(int id);
    List<AirlineVO>getRemarkList(SearchVO vo);
    List<AirlineVO>getSearchList(SearchVO vo);
}
