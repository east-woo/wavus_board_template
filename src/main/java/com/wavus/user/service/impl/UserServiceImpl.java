package com.wavus.user.service.impl;

import com.wavus.user.service.UserService;
import com.wavus.user.vo.UserVO;
import egovframework.com.cmm.service.impl.CmmUseDAO;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl  extends EgovAbstractServiceImpl implements UserService {

    CmmUseDAO cmmUseDAO;
    public UserServiceImpl(CmmUseDAO cmmUseDAO) {this.cmmUseDAO = cmmUseDAO;}
    @Override
    public List<UserVO> getAllUsers() throws Exception{
        return cmmUseDAO.selectList("UserDAO.getAllUsers");
    }

/*    @Override
    public void registerUser(UserVO user) {
        userMapper.insertUser(user);
    }*/



}