package com.milk.myweb.service;

import java.sql.Timestamp;
import java.util.HashMap;

import com.milk.myweb.vo.*;

public interface UserService {

	// ���̵� �ߺ� üũ
	public int idDuplicateCheck(String checkId) throws Exception;

	// ȸ�� ����
	public void userRegister(HashMap<String, Object> params) throws Exception;

	// �α���
	public UserVo login(HashMap<String, Object> params) throws Exception;

	// �ֱ� �α��� �ð� ������Ʈ
	public void loginTimeUpdate(HashMap<String, Object> params) throws Exception;

	// ��õ ��, ��õ Ȱ��ȭ �ð� ������Ʈ
	public void updateRecommendActiveTime(String u_id) throws Exception;

	// ��õ Ȱ��ȭ �ð� ��ȸ
	public Timestamp checkRecommendActiveTime(String u_id) throws Exception;
}
