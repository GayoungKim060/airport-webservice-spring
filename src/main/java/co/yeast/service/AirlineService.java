package co.yeast.service;

import co.yeast.bean.AirlineVO;
import co.yeast.bean.SearchVO;

import java.util.List;
import java.util.Optional;

/* Service 역할 
* Controller에 의해 호출되어 실제 비즈니스 로직과 트랜잭션을 처리
* dao를 호출하여 DB CRUD를 처리 후 Controller로 반환
* */
public interface AirlineService {
    public int insertAirline(AirlineVO vo);
    public int deleteAirline(int id);
    public int updateAirline(AirlineVO vo);
    public AirlineVO getAirline(int id);
    public List<AirlineVO> getAirlineList();
    public List<AirlineVO> getRemarkList(String remark);
    public List<AirlineVO> getSearchList(String searchType, String keyword);        // SearchVO 사용?
}
