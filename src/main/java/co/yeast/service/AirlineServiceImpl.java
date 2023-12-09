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
        return 0;
    }

    @Override
    public int deleteAirline(int id) {
        return 0;
    }

    @Override
    public int updateAirline(AirlineVO vo) {
        return 0;
    }

    @Override
    public AirlineVO getAirline(int id) {
        return airlineDAO.getAirline(id);
    }

    @Override
    public List<AirlineVO> getAirlineList() {
        return airlineDAO.getAirlineList();
    }
}
