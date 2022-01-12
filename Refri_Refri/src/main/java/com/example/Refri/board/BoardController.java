package com.example.Refri.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/board/")
@Controller
public class BoardController {
	
	
	
	@RequestMapping("listFreshSwitch")
	public ModelAndView listFreshSwitch(HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		session.setAttribute("section", "boardFreshList");
		
		ModelAndView mav = new ModelAndView("member/main");
		return mav;
	}
	
	@RequestMapping("listFresh")
	public ModelAndView listFresh() {
		// go to listFresh.
		ModelAndView mav=new ModelAndView("board/listFresh");
		return mav;
	}
	
	
	@RequestMapping("addFreshSwitch")
	public ModelAndView addFreshSwitch(HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		session.setAttribute("section", "boardFreshAdd");
		
		ModelAndView mav = new ModelAndView("member/main");
		return mav;
	}
	
	@RequestMapping("addFresh")
	public ModelAndView addFresh() {
		// go to listFresh.
		ModelAndView mav=new ModelAndView("board/addFresh");
		return mav;
	}
	

}
