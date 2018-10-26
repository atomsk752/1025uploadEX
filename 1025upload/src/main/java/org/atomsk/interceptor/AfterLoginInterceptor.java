package org.atomsk.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.atomsk.domain.MemberVO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class AfterLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		Object result = modelAndView.getModel().get("member");
		
		log.info("RESULT: " + result);
		
		if(result == null) {
			return;
			
		}
		
		MemberVO memberVO = (MemberVO)result;
		
		Cookie loginCookie = new Cookie("lcookie", URLEncoder.encode(memberVO.getName(), "UTF-8"));
		loginCookie.setMaxAge(60*5); //초단위 
		response.addCookie(loginCookie);
	}

}
