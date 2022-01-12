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
	public String login(HttpServletRequest req,Refrimem member) {
		/*
		 * 1. id를 가져오고 로그인이되는지 확인한다.
		 * 2. 냉장고가 있으면 첫번째 냉장고의 케이스리스트로, 냉장고가 없으면 냉장고리스트로 간다.
		 * 3. member/main.jsp로 이동한다.
		 */
		String id=member.getId();
		String loginResult=service.login(id, member.getPwd());
		
		String controller_path="";
		// 로그인 성공시
		if(loginResult.equals("")) {
			HttpSession session=req.getSession();
			session.setAttribute("id", id);
			controller_path="/refri/list";

			// 냉장고가 있으면 첫번째 냉장고의 케이스 리스트로 간다.
			boolean flag=r_service.isRefri(id);
			if(flag) {
				Refri r=r_service.getFirst(id);
				session.setAttribute("r", r);
				controller_path="/case/list";
			}
		}
		
		System.out.println("=======로그인 시작================================");
		System.out.println("id : "+id+"로 로그인되었습니다.");
		System.out.println(controller_path+"로 이동합니다.");
		System.out.println("=======로그인 끝================================");
		
		return controller_path;
	}
	
	@RequestMapping("main")
	public void main() {}
	
	@RequestMapping("bootswatch")
	public void bootswatch() {}

}
