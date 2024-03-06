package com.wavus.user.service;

import com.wavus.user.vo.UserVO;

import java.util.List;

public interface UserService {
    /*void registerUser(UserVO user);*/

    List<UserVO> getAllUsers() throws Exception;
}