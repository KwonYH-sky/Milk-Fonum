package com.milk.myweb.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.milk.myweb.dao.BoardDao;
import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.extra.paging.SearchCriteria;
import com.milk.myweb.vo.BoardVo;

@Repository("BoardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sqlSession;

	final static String NAMESPACE = "com.milk.mapper.boardMapper";

	@Override
	public void write(BoardVo boardVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".write", boardVo);
	}

	@Override
	public BoardVo read(Integer b_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".read", b_num);
	}

	@Override
	public void update(BoardVo boardVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", boardVo);

	}

	@Override
	public void delete(Integer b_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", b_num);
	}

	@Override
	public int countBoards() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countBoards");
	}

	@Override
	public void updateReplyCount(Integer b_num) throws Exception {
		sqlSession.update(NAMESPACE + ".countReply", b_num);

	}

	@Override
	public void updateViewCount(Integer b_num) throws Exception {
		sqlSession.update(NAMESPACE + ".countViews", b_num);

	}

	@Override
	public List<BoardVo> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	@Override
	public List<BoardVo> listPaging(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return sqlSession.selectList(NAMESPACE + ".listPaging", page);
	}

	@Override
	public List<BoardVo> listCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listCriteria", cri);
	}

	//
	@Override
	public List<BoardVo> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listSearch", cri);
	}

	//
	@Override
	public int countSerchBoard(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countSearchBoards", cri);
	}

	@Override
	public void countRecommned(Integer b_num) throws Exception {
		sqlSession.update(NAMESPACE + ".countRecommend", b_num);

	}

}
