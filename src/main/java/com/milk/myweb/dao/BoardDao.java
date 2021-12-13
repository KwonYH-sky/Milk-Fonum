package com.milk.myweb.dao;

import java.util.List;

import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.extra.paging.SearchCriteria;
import com.milk.myweb.vo.BoardVo;

public interface BoardDao {

	// 글 작성
	public void write(BoardVo boardVo) throws Exception;

	// 글 읽기
	public BoardVo read(Integer b_num) throws Exception;

	// 글 수정
	public void update(BoardVo boardVo) throws Exception;

	// 글 삭제
	public void delete(Integer b_num) throws Exception;

	// 전체 글 수 구하기
	public int countBoards() throws Exception;

	// 댓글 수
	public void updateReplyCount(Integer b_num) throws Exception;

	// 조회수
	public void updateViewCount(Integer b_num) throws Exception;

	// 글 전체 목록보기
	public List<BoardVo> listAll() throws Exception;

	// 글 페이징
	public List<BoardVo> listPaging(int page) throws Exception;

	// 페이징 처리를 위한 메소드
	public List<BoardVo> listCriteria(Criteria cri) throws Exception;

	// 글 검색 결과
	public List<BoardVo> listSearch(SearchCriteria cri) throws Exception;

	// 글 검색 결과 개수
	public int countSerchBoard(SearchCriteria cri) throws Exception;

	// 글 추천 수
	public void countRecommned(Integer b_num) throws Exception;

}
