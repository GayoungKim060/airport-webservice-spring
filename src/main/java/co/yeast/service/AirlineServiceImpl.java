package co.yeast.service;

import co.yeast.bean.AirlineVO;
import co.yeast.dao.AirlineDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AirlineServiceImpl implements AirlineService{
    @Autowired
    AirlineDAO airlineDAO;

    @Override
    public int insertAirline(AirlineVO vo) {
        return airlineDAO.insertAirline(vo);
    }

    @Override
    public int deleteAirline(int id) {
        return airlineDAO.deleteAirline(id);
    }

    @Override
    public int updateAirline(AirlineVO vo) {
        return airlineDAO.updateAirline(vo);
    }

    @Override
    public AirlineVO getAirline(int id) {
//        view 에서는 String으로 바꿔줘야함. 이렇게 넘기면 Optional 클래스로 넘어가면 jstl인식 불가
        return airlineDAO.getAirline(id);   // airlineDAO.getAirline(id)는 Optional 클래스로 반환

    /*
    Optional.ofNullable()은 null이면 Optional.empty()를 반환하고,
    그렇지 않으면 해당값을 감싸서 Optional 객체를 생성
    */
    }

    @Override
    public List<AirlineVO> getAirlineList() {
        return airlineDAO.getAirlineList();     // airlineDAO.getAirlineList(id)는 Optional 클래스로 반환
    }

    @Override
    public List<AirlineVO> getRemarkList(String remark) {
        return airlineDAO.getRemarkList(remark);
    }

    @Override
    public List<AirlineVO> getSearchList(String searchType, String keyword){
        return airlineDAO.getSearchList(searchType, keyword);
    }
}
