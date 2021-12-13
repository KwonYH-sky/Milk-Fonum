package com.milk.myweb.dao;

import java.util.List;

import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.vo.BoardReplyVo;

public interface BoardReplyDao {

	public List<BoardReplyVo> list(Integer b_num) throws Exception;

	public void create(BoardReplyVo vo) throws Exception;

	public void update(BoardReplyVo vo) throws Exception;

	public void delete(Integer re_num) throws Exception;

	public List<BoardReplyVo> listPage(Integer b_num, Criteria cri) throws Exception;

	public int count(Integer b_num) throws Exception;

	public int getB_num(Integer re_num) throws Exception;
}
