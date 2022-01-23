package com.example.Refri.mem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.Refri.refri.Refri;
import com.example.Refri.refri.RefriService;

@RequestMapping("/member/")
@Controller
public class RefrimemController {
	
	@Autowired
	private RefrimemService service;
	
	@Autowired
	private RefriService r_service;
	
	@RequestMapping("login")
	public ModelAndView login(HttpServletRequest req,Refrimem member) {
		System.out.println("----/refrimem/login");
		
		String id=member.getId();
		String loginResult=service.login(id, member.getPwd());
		
		ModelAndView mav=new ModelAndView();
		if(loginResult.equals("")) {
			HttpSession session=req.getSession();
			session.setAttribute("id", id);
			// 냉장고가 있으면 첫번째 냉장고의 케이스리스트로, 냉장고가 없으면 냉장고리스트로 간다.
			session.setAttribute("section", "refriList");
			
			boolean flag=r_service.isRefri(id);
			if(flag) {
				Refri r=r_service.getFirst(id);
				session.setAttribute("r", r);
				session.setAttribute("section", "caseList");
			}
			
			mav.setViewName("member/main");
		}
		
		return mav;
	}
	
	@RequestMapping("main")
	public void main() {}

}
