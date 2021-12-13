package com.milk.myweb.extra.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 게시판 세션 없으면 접근 간섭
// 로그인처리를 담당하는 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	// 컨트롤러보다 먼저 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object obj = session.getAttribute("loginInfo");
		System.out.println("AuthenticationInterceptor: " + session.getAttribute("loginInfo"));
		System.out.println("AuthenticationInterceptor: " + obj);
		if (obj == null) {
			response.sendRedirect("/loginForm");
			
			// 더 이상 컨트롤러 요청으로 가지 않도록 false 반환
			return false;
		}
		// preHandle()의 return은 컨트롤러 요청이 URI로 가도 되냐 안되냐를 허가하는 의미
		// 따라서 true인 경우 컨트롤러 URI로 가게 된다
		return true;
	}

	// 컨트롤러가 수행되고 화면이 보여지기 직전 수행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
