package co.yeast.service;

import co.yeast.bean.UserVO;
import co.yeast.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserDAO userDAO;

    @Override
    public UserVO getUser(UserVO vo){
        return userDAO.getUser(vo);
    }
}
