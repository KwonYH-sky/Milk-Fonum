package com.milk.myweb.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.milk.myweb.extra.DuplicateCheck;
import com.milk.myweb.service.UserService;
import com.milk.myweb.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/index")
	public String home(HttpSession session) {
		return "index";
	}

	// 회원가입 폼
	@RequestMapping("/registerForm")
	public String moveRegisterForm() {
		return "registerForm";
	}

	// 로그인 폼
	@RequestMapping("/loginForm")
	public String moveloginForm() {
		return "loginForm";
	}

	// 아이디 중복 확인
	@RequestMapping(value = "registerForm/idDuplicateCheck", produces = "application/text; charset=utf8")
	public @ResponseBody String responseIdDupCheck(@RequestParam String paramId) throws Exception {
		int result = DuplicateCheck.METHOD_NOT_WORK;
		String checkedId = "";
		result = userService.idDuplicateCheck(paramId);
		if (result == DuplicateCheck.NOT_DUPLICATE) {
			checkedId = paramId;
		} else if (result == DuplicateCheck.DUPLICATE) {
			checkedId = "";
		} else {
			checkedId = "";
		}
		return checkedId;
	}

	// 회원 가입
	@RequestMapping("registerForm/register")
	public String responseRegister(@RequestParam HashMap<String, Object> params) throws Exception {
		userService.userRegister(params);
		JOptionPane.showMessageDialog(null, "회원 가입 성공!");
		return "redirect:/index";
	}

	// 로그인
	@RequestMapping(value = "loginForm/login", produces = "application/text; charset=utf8")
	public @ResponseBody String login(@RequestParam HashMap<String, Object> params, HttpSession session)
			throws Exception {
		String result = "X";

		// 로그인이 성공시 UserVo 객체 반환
		UserVo login_info = userService.login(params);

		if (login_info != null) {
			// 로그인 시간 업데이트
			userService.loginTimeUpdate(params);
			// 세션 저장
			session.setAttribute("loginInfo", login_info);
			result = login_info.getU_id();
		}
		return result;
	}

	@RequestMapping("logout")
	public String responseLogout(HttpSession session) {
		session.invalidate();
		return "redirect:index";
	}
}
