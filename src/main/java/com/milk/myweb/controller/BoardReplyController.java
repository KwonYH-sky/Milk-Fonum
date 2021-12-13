package com.milk.myweb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.milk.myweb.extra.paging.Criteria;
import com.milk.myweb.extra.paging.PageMaker;
import com.milk.myweb.service.BoardReplyService;
import com.milk.myweb.vo.BoardReplyVo;

@RestController
@RequestMapping("/replies")
public class BoardReplyController {

	@Autowired
	private BoardReplyService replyService;

	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<String> register(@RequestBody BoardReplyVo vo) {

		ResponseEntity<String> entity = null;

		try {
			replyService.addReply(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/all/{b_num}", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<List<BoardReplyVo>> list(@PathVariable("b_num") Integer b_num) {

		ResponseEntity<List<BoardReplyVo>> entity = null;

		try {
			entity = new ResponseEntity<>(replyService.listReply(b_num), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{re_num}", method = { RequestMethod.GET, RequestMethod.PATCH, RequestMethod.POST })
	public ResponseEntity<String> update(@PathVariable("re_num") Integer re_num, @RequestBody BoardReplyVo vo) {
		ResponseEntity<String> entity = null;
		try {
			vo.setRe_num(re_num);
			replyService.modifyReply(vo);

			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{re_num}", method = { RequestMethod.GET, RequestMethod.DELETE })
	public ResponseEntity<String> remove(@PathVariable("re_num") Integer re_num) {
		ResponseEntity<String> entity = null;

		try {
			replyService.removeReply(re_num);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{b_num}/{page}", method = { RequestMethod.GET, RequestMethod.PUT })
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("b_num") Integer b_num,
			@PathVariable("page") Integer page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			cri.setPage(page);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<String, Object>();
			List<BoardReplyVo> list = replyService.listReplyPage(b_num, cri);

			map.put("list", list);

			int replyCount = replyService.count(b_num);
			pageMaker.setTotalCount(replyCount);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
