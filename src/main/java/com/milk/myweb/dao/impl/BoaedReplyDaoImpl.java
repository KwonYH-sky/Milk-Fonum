package com.milk.myweb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.milk.myweb.dao.BoardReplyDao;
import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.vo.BoardReplyVo;

@Repository("BoaedReplyDao")
public class BoaedReplyDaoImpl implements BoardReplyDao {

	@Autowired
	SqlSession sqlSession;
	
	final static String NAMESPACE = "com.milk.mapper.replyMapper";
	
	@Override
	public List<BoardReplyVo> list(Integer b_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".list", b_num);
	}

	@Override
	public void create(BoardReplyVo vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", vo);
	}

	@Override
	public void update(BoardReplyVo vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", vo);
	}

	@Override
	public void delete(Integer re_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", re_num);
	}

	@Override
	public List<BoardReplyVo> listPage(Integer b_num, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("b_num", b_num);
		paramMap.put("cri", cri);
		
		return sqlSession.selectList(NAMESPACE + ".listPage", paramMap);
	}

	@Override
	public int count(Integer b_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".count", b_num);
	}

	@Override
	public int getB_num(Integer re_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getB_num", re_num);
	}

}
