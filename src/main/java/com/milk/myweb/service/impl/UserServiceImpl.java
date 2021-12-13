package com.milk.myweb.service.impl;

import java.sql.Timestamp;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.milk.myweb.dao.UserDao;
import com.milk.myweb.extra.*;
import com.milk.myweb.service.UserService;
import com.milk.myweb.vo.UserVo;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public int idDuplicateCheck(String checkId) throws Exception {
		int check = DuplicateCheck.SQL_NOT_WORK;
		check = userDao.idDuplicateCheck(checkId);
		return check;
	}

	@Override
	public void userRegister(HashMap<String, Object> params) throws Exception {
		userDao.userRegister(params);
	}

	@Override
	public UserVo login(HashMap<String, Object> params) throws Exception {
//		System.out.println("UserService.login params : " + params);
		return userDao.login(params);
	}

	@Override
	public void loginTimeUpdate(HashMap<String, Object> params) throws Exception {
		userDao.loginTimeUpdate(params);
	}

	@Override
	public void updateRecommendActiveTime(String u_id) throws Exception {
		userDao.updateRecommendActiveTime(u_id);

	}

	@Override
	public Timestamp checkRecommendActiveTime(String u_id) throws Exception {
		return userDao.checkRecommendActiveTime(u_id);
	}

}
