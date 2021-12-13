package com.milk.myweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.milk.myweb.dao.BoardDao;
import com.milk.myweb.dao.BoardReplyDao;
import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.service.BoardReplyService;
import com.milk.myweb.vo.BoardReplyVo;

@Service("BoardReplyService")
public class BoardReplyServiceImpl implements BoardReplyService {

	@Autowired
	private BoardReplyDao boardReplyDao;
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardReplyVo> listReply(Integer b_num) throws Exception {
		return boardReplyDao.list(b_num);
	}

	@Override
	public void addReply(BoardReplyVo vo) throws Exception {
		boardReplyDao.create(vo);
		boardDao.updateReplyCount(vo.getB_num());

	}

	@Override
	public void modifyReply(BoardReplyVo vo) throws Exception {
		boardReplyDao.update(vo);
	}

	@Override
	public void removeReply(Integer re_num) throws Exception {
		int b_num = boardReplyDao.getB_num(re_num);
		
		boardReplyDao.delete(re_num);
		boardDao.updateReplyCount(b_num);
	}

	@Override
	public List<BoardReplyVo> listReplyPage(Integer b_num, Criteria cri) throws Exception {
		return boardReplyDao.listPage(b_num, cri);
	}

	@Override
	public int count(Integer b_num) throws Exception {
		return boardReplyDao.count(b_num);
	}

}
