package org.atomsk.controller;

import org.atomsk.domain.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

//fake login, get방식으로 간단하게 구현
@Controller
@Log4j
public class MemberController {

	@GetMapping("/login")
	public void login(String id, String pw, Model model) {
		
		log.info("ID: " + id + "PW: "+pw);
		
		if (id.equals("aaa")&& pw.equals("111")) {
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setPw(pw);
			vo.setName("yochen");
			model.addAttribute("member", vo);
		}

		
	}
}
