package com.milk.myweb.service;

import java.util.List;

import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.vo.BoardReplyVo;

public interface BoardReplyService {
	
	public List<BoardReplyVo> listReply(Integer b_num) throws Exception;

	public void addReply(BoardReplyVo vo) throws Exception;

	public void modifyReply(BoardReplyVo vo) throws Exception;

	public void removeReply(Integer re_num) throws Exception;

	public List<BoardReplyVo> listReplyPage(Integer b_num, Criteria cri) throws Exception;

	public int count(Integer b_num) throws Exception;

}
