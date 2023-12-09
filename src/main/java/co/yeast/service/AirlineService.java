package co.yeast.service;

import co.yeast.bean.AirlineVO;

import java.util.List;

public interface AirlineService {
    public int insertAirline(AirlineVO vo);
    public int deleteAirline(int id);
    public int updateAirline(AirlineVO vo);
    public AirlineVO getAirline(int id);
    public List<AirlineVO> getAirlineList();
}
