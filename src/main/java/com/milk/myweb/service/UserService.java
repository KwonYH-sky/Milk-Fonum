package com.milk.myweb.service;

import java.sql.Timestamp;
import java.util.HashMap;

import com.milk.myweb.vo.*;

public interface UserService {

	// 아이디 중복 체크
	public int idDuplicateCheck(String checkId) throws Exception;

	// 회원 가입
	public void userRegister(HashMap<String, Object> params) throws Exception;

	// 로그인
	public UserVo login(HashMap<String, Object> params) throws Exception;

	// 최근 로그인 시간 업데이트
	public void loginTimeUpdate(HashMap<String, Object> params) throws Exception;

	// 추천 후, 추천 활성화 시간 업데이트
	public void updateRecommendActiveTime(String u_id) throws Exception;

	// 추천 활성화 시간 조회
	public Timestamp checkRecommendActiveTime(String u_id) throws Exception;
}
