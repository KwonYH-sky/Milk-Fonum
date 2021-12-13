package com.milk.myweb.dao;

import java.util.List;

import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.extra.paging.SearchCriteria;
import com.milk.myweb.vo.BoardVo;

public interface BoardDao {

	// �� �ۼ�
	public void write(BoardVo boardVo) throws Exception;

	// �� �б�
	public BoardVo read(Integer b_num) throws Exception;

	// �� ����
	public void update(BoardVo boardVo) throws Exception;

	// �� ����
	public void delete(Integer b_num) throws Exception;

	// ��ü �� �� ���ϱ�
	public int countBoards() throws Exception;

	// ��� ��
	public void updateReplyCount(Integer b_num) throws Exception;

	// ��ȸ��
	public void updateViewCount(Integer b_num) throws Exception;

	// �� ��ü ��Ϻ���
	public List<BoardVo> listAll() throws Exception;

	// �� ����¡
	public List<BoardVo> listPaging(int page) throws Exception;

	// ����¡ ó���� ���� �޼ҵ�
	public List<BoardVo> listCriteria(Criteria cri) throws Exception;

	// �� �˻� ���
	public List<BoardVo> listSearch(SearchCriteria cri) throws Exception;

	// �� �˻� ��� ����
	public int countSerchBoard(SearchCriteria cri) throws Exception;

	// �� ��õ ��
	public void countRecommned(Integer b_num) throws Exception;

}
