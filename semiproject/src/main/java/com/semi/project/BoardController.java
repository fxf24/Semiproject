package com.semi.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping("/board/boarddetail/{seq}")
	public ModelAndView getBoardDetail(@PathVariable("seq") int seq) {
		ModelAndView mv = new ModelAndView();
		BoardVO bvo = service.getOneBoard(seq);
		mv.addObject("result", bvo);
		mv.setViewName("/boarddetail");
		return mv;
	}
	
	@RequestMapping(value="/board/signup", method=RequestMethod.GET)
	public String signupform() {
		return "/signup";
	}
	@RequestMapping(value="/board/signup", method=RequestMethod.POST,
			produces={"application/json;charset=utf-8"})
	@ResponseBody
	public String signup(String id, String pw, String name) {
		MemberVO member = new MemberVO(id, pw, name);
		service.signupMember(member);
		String result = "{\"process\":\"회원가입완료\"}";
		
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/board/boardwrite", method=RequestMethod.GET)
	public String boardwriteform() {
		return "/boardwrite";
	}
	@RequestMapping(value="/board/boardwrite", method=RequestMethod.POST,
			produces={"application/json;charset=utf-8"})
	@ResponseBody
	public String boardwrite(String title, String contents, String writer) {
		BoardVO bvo = new BoardVO(title, contents, writer);
		System.out.println(bvo);
		service.writeBoard(bvo);
		String result = "{\"process\":\"작성완료\"}";
		
		System.out.println(result);
		return result;
	}
}
