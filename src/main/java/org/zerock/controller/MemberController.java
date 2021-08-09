package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	
	@GetMapping("/join")
	public void join() {
		
	}

	@PostMapping("/join")
	public String join(MemberVO member, RedirectAttributes rttr) {
		log.info("================================");
		log.info("register: " + member);
		service.join(member);
		rttr.addFlashAttribute("result", member.getUserid());
		return "redirect:/customLogin";
	}

	@PostMapping("/idCheck")
	public @ResponseBody String idCheck(String userid) {
		return service.idCheck(userid) != null? "using" : "not using";
	}
}
