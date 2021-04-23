package com.semi.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping("/board")
	public ModelAndView showBoard() {
		ModelAndView mv = new ModelAndView();
		List<BoardVO> list = service.getAllBoard();
		mv.addObject("list", list);
		mv.setViewName("/board");
		return mv;
	}
	
	@RequestMapping(value="/board/login", method=RequestMethod.GET)
	public String loginform() {
		return "/login";
	}
	@RequestMapping(value="/board/login", method=RequestMethod.POST,
			produces={"application/json;charset=utf-8"})
	@ResponseBody
	public String getMember(String id, String pw) {
		MemberVO member = service.getMember(id);
		String result = null;
		if(member != null) {
			result = "{\"process\":\"정상로그인\", \"id\":\""+ member.getId()+"\", \"pw\":\""+member.getPassword()+"\"}";
		}
		else {
			result = "{\"process\":\"비정상로그인\", \"id\":\"none\", \"pw\":\"none\"}";	
		}
		System.out.println(result);
		return result;
	}
}
