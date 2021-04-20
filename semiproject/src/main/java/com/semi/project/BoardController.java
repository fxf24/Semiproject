package com.semi.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
