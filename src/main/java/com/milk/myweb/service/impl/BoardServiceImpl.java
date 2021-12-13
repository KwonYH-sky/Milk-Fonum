package com.milk.myweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.milk.myweb.dao.BoardDao;
import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.extra.paging.SearchCriteria;
import com.milk.myweb.service.BoardService;
import com.milk.myweb.vo.BoardVo;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public void write(BoardVo boardVo) throws Exception {
		dao.write(boardVo);

	}

	@Override
	public BoardVo read(Integer b_num) throws Exception {
		dao.updateViewCount(b_num);
		return dao.read(b_num);
	}

	@Override
	public void update(BoardVo boardVo) throws Exception {
		dao.update(boardVo);
	}

	@Override
	public void delete(Integer b_num) throws Exception {
		dao.delete(b_num);
	}

	@Override
	public int countBoards() throws Exception {
		return dao.countBoards();
	}

	@Override
	public void updateReplyCount(Integer b_num) throws Exception {
		dao.updateReplyCount(b_num);
	}

	@Override
	public void updateViewCount(Integer b_num) throws Exception {
		dao.updateViewCount(b_num);
	}

	@Override
	public List<BoardVo> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVo> listPaging(int page) throws Exception {
		return dao.listPaging(page);
	}

	@Override
	public List<BoardVo> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public List<BoardVo> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int countSerchBoard(SearchCriteria cri) throws Exception {
		return dao.countSerchBoard(cri);
	}

	@Override
	public void countRecommned(Integer b_num) throws Exception {
		dao.countRecommned(b_num);
	}

}
