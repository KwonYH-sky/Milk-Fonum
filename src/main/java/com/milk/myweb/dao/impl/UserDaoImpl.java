package com.milk.myweb.dao.impl;

import java.sql.Timestamp;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.milk.myweb.dao.UserDao;
import com.milk.myweb.vo.UserVo;

@Repository("UserDao")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	final static String NAMESPACE_USER = "com.milk.mapper.userMapper";

	@Override
	public int idDuplicateCheck(String checkId) throws Exception {
		return sqlSession.selectOne(NAMESPACE_USER + ".idDuplicateCheck", checkId);
	}

	@Override
	public void userRegister(HashMap<String, Object> params) throws Exception {
		sqlSession.insert(NAMESPACE_USER + ".userRegister", params);
	}

	@Override
	public UserVo login(HashMap<String, Object> params) throws Exception {
		System.out.println("UserDao.login params : "+ params);
		System.out.println("UserDao.login return : " + sqlSession.selectOne(NAMESPACE_USER + ".login", params) );
		return sqlSession.selectOne(NAMESPACE_USER + ".login", params);
	}

	@Override
	public void loginTimeUpdate(HashMap<String, Object> params) throws Exception {
		sqlSession.update(NAMESPACE_USER + ".loginTimeUpdate", params);
	}

	@Override
	public void updateRecommendActiveTime(String u_id) throws Exception {
		sqlSession.update(NAMESPACE_USER + ".updateRecommendActiveTime", u_id);
		
	}

	@Override
	public Timestamp checkRecommendActiveTime(String u_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE_USER + ".checkRecommendActiveTime", u_id);
	}

}
