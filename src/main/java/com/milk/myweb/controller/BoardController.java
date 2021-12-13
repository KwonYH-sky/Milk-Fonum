package com.milk.myweb.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.milk.myweb.extra.paging.PageMaker;
import com.milk.myweb.extra.paging.SearchCriteria;
import com.milk.myweb.service.BoardReplyService;
import com.milk.myweb.service.BoardService;
import com.milk.myweb.vo.BoardVo;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService service;
	
	@Autowired
	private BoardReplyService replyService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("searchCri") SearchCriteria searchCri, Model model) throws Exception {
		List<BoardVo> dto = service.listCriteria(searchCri);

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(searchCri);
		Integer totalNum = service.countBoards();
		pageMaker.setTotalCount(totalNum);

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boards", dto);
//		model.addAttribute("board", service.listAll());
		return "board/list";
	}

	/*
	 * @RequestMapping(value = "list", method = RequestMethod.GET) public String
	 * list(Model model, Criteria cri) throws Exception {
	 * 
	 * model.addAttribute("boards", service.listCriteria(cri));
	 * model.addAttribute("board", service.listAll()); return "/board/list"; }
	 */
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(@RequestParam("b_num") int b_num, @ModelAttribute("searchCri") SearchCriteria searchCri, Model model)
			throws Exception {
		LOGGER.info("view()...................");

		model.addAttribute("board", service.read(b_num));
		model.addAttribute("count", replyService.count(b_num));
		return "/board/view";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String getWrite() {
		LOGGER.info("getWrite()..............");
		return "/board/write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String postWrite(BoardVo vo, RedirectAttributes rttr) throws Exception {
		LOGGER.info("postWrite()..............");

		service.write(vo);

		rttr.addFlashAttribute("msg", "regSuccess");

		return "redirect:/board/list";
	}

	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String getModify(@RequestParam("b_num") int b_num, @ModelAttribute("searchCri") SearchCriteria searchCri, Model model)
			throws Exception {
		LOGGER.info("getModify............ ");

		model.addAttribute("board", service.read(b_num));

		return "board/modify";

	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String postModify(BoardVo vo, SearchCriteria searchCri, RedirectAttributes rttr) throws Exception {
		LOGGER.info("postModify............");

		service.update(vo);
		rttr.addAttribute("page", searchCri.getPage());
		rttr.addAttribute("perPageNum", searchCri.getPerPageNum());
		rttr.addFlashAttribute("msg", "modSuccess");

		LOGGER.info(rttr.toString());

		return "redirect:/board/list";
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(@RequestParam("b_num") int b_num, SearchCriteria searchCri, RedirectAttributes rttr) throws Exception {

		LOGGER.info("delete post...........");

		service.delete(b_num);
		rttr.addAttribute("page", searchCri.getPage());
		rttr.addAttribute("perPageNum", searchCri.getPerPageNum());
		rttr.addFlashAttribute("msg", "delSuccess");

		return "redirect:/board/list";
	}
}
