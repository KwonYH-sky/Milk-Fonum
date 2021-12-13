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

	// ȸ������ ��
	@RequestMapping("/registerForm")
	public String moveRegisterForm() {
		return "registerForm";
	}

	// �α��� ��
	@RequestMapping("/loginForm")
	public String moveloginForm() {
		return "loginForm";
	}

	// ���̵� �ߺ� Ȯ��
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

	// ȸ�� ����
	@RequestMapping("registerForm/register")
	public String responseRegister(@RequestParam HashMap<String, Object> params) throws Exception {
		userService.userRegister(params);
		JOptionPane.showMessageDialog(null, "ȸ�� ���� ����!");
		return "redirect:/index";
	}

	// �α���
	@RequestMapping(value = "loginForm/login", produces = "application/text; charset=utf8")
	public @ResponseBody String login(@RequestParam HashMap<String, Object> params, HttpSession session)
			throws Exception {
		String result = "X";

		// �α����� ������ UserVo ��ü ��ȯ
		UserVo login_info = userService.login(params);

		if (login_info != null) {
			// �α��� �ð� ������Ʈ
			userService.loginTimeUpdate(params);
			// ���� ����
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
