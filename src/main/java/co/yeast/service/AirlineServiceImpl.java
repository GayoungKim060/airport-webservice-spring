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
        return airlineDAO.getAirline(id);
    }

    @Override
    public List<AirlineVO> getAirlineList() {
        return airlineDAO.getAirlineList();
    }
}
