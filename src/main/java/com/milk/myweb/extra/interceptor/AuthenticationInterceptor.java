package com.milk.myweb.extra.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// �Խ��� ���� ������ ���� ����
// �α���ó���� ����ϴ� ���ͼ���
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	// ��Ʈ�ѷ����� ���� ����
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		// loginó���� ����ϴ� ����� ������ ��� �ִ� ��ü�� ������
		Object obj = session.getAttribute("loginInfo");
		System.out.println("AuthenticationInterceptor: " + session.getAttribute("loginInfo"));
		System.out.println("AuthenticationInterceptor: " + obj);
		if (obj == null) {
			response.sendRedirect("/loginForm");
			
			// �� �̻� ��Ʈ�ѷ� ��û���� ���� �ʵ��� false ��ȯ
			return false;
		}
		// preHandle()�� return�� ��Ʈ�ѷ� ��û�� URI�� ���� �ǳ� �ȵǳĸ� �㰡�ϴ� �ǹ�
		// ���� true�� ��� ��Ʈ�ѷ� URI�� ���� �ȴ�
		return true;
	}

	// ��Ʈ�ѷ��� ����ǰ� ȭ���� �������� ���� ����
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
