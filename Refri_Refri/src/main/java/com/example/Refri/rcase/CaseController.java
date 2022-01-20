package com.example.Refri.rcase;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.Refri.food.Food;
import com.example.Refri.food.FoodService;
import com.example.Refri.refri.Refri;
import com.example.Refri.refri.RefriService;

@RequestMapping("/case/")
@Controller
public class CaseController {

	@Autowired
	private CaseSevice service;

	@Autowired
	private RefriService r_service;
	
	@Autowired
	private FoodService f_service;

	@RequestMapping("listSwitch")
	public ModelAndView listSwitch(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		// 냉장고가 없다면 되돌아가기.
		String id=(String) session.getAttribute("id");
		boolean flag=r_service.isRefri(id);
		if(!flag) {
			session.setAttribute("section", "refriList");
			req.setAttribute("caseListSwitchResult", "냉장고가 없어 케이스 리스트를 불러들일 수 없습니다.");
		}else {
			session.setAttribute("section", "caseList");
		}

		ModelAndView mav = new ModelAndView("member/main");
		return mav;
	}

	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Refri r = (Refri) session.getAttribute("r");

		ArrayList<Case> list = service.getByRefri(r);
		ArrayList<Case> dispList=new ArrayList<Case>();
		for(int i=0;i<list.size();i++) {
			Case c=list.get(i);
			if(c.getDisp()!=0) {
				dispList.add(c);
			}
		}

		ModelAndView mav = new ModelAndView("case/list", "list", list);
		mav.addObject("dispList", dispList);
		return mav;
	}

	@RequestMapping("addSwitch")
	public ModelAndView addSwitch(HttpServletRequest req,
			@RequestParam(value="r_num", required=false) String r_num) {
		HttpSession session = req.getSession(false);
		String id=(String) session.getAttribute("id");
		boolean flag=r_service.isRefri(id);
		if(!flag) {
			session.setAttribute("section", "refriList");
			req.setAttribute("caseAddSwitchResult", "냉장고가 없어 케이스 추가하기를 불러들일 수 없습니다.");
		}else {
			session.setAttribute("section", "caseAdd");
			if(r_num!=null) {
				int num=Integer.parseInt(r_num);
				Refri r=r_service.getRefri(num);
				session.setAttribute("r",r);
			}
		}

		ModelAndView mav = new ModelAndView("member/main");
		return mav;
	}

	@RequestMapping("addCase")
	public ModelAndView addCase() {
		// go to addCase form.
		ModelAndView mav=new ModelAndView("case/addCase");
		return mav;
	}

	@RequestMapping("add")
	public String add(Case c, HttpServletRequest req) {
		service.addCase(c);

		return "member/main";
	}
	
	
	@RequestMapping("addDisp")
	public String editDisp(Case c) {
		//이미 넣어진 케이스는 수정하지 않음.
		Case ori=service.getCase(c.getNum());
		c.setR_num(ori.getR_num());
		c.setName(ori.getName());
		System.out.println(c);
		
		service.editCase(c);
		return "redirect:/case/listDisp";
	}
	
	@RequestMapping("findDisp")
	public ModelAndView findDisp(@RequestParam("disp") int disp
			, HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		Refri r = (Refri) session.getAttribute("r");
		
		Case c=service.getByDisp(disp, r);
		
		// 케이스에 있는 음식 리스트를 불러온다.
		ArrayList<Food> foodList=f_service.getByCase(c.getNum());
		
		ModelAndView mav=new ModelAndView("case/disp/disp_all","c",c);
		mav.addObject("list",foodList);
		return mav;
	}
	@RequestMapping("findCaseByDisp")
	public ModelAndView findCaseByDisp(@RequestParam("disp") int disp
			, HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		Refri r = (Refri) session.getAttribute("r");
		
		Case c=service.getByDisp(disp, r);
		
		System.out.println("find Case : "+c);
		
		ModelAndView mav=new ModelAndView("json/caseJson","c",c);
		return mav;
	}
	
	@RequestMapping("listDisp")
	public ModelAndView listDisp(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		Refri r = (Refri) session.getAttribute("r");

		// 선택한 냉장고의 케이스들을 리스트로 가져온다.
		ArrayList<Case> list = service.getByRefri(r);
		// 지정된 디스플레이가 있는 케이스들을 리스트로 가져온다.
		ArrayList<Case> dispList=new ArrayList<Case>();
		for(int i=0;i<list.size();i++) {
			Case c=list.get(i);
			if(c.getDisp()!=0) {
				dispList.add(c);
			}
		}

		ModelAndView mav = new ModelAndView("json/caseListJson", "list", dispList);
		return mav;
	}
	
	@RequestMapping("removeFromDisp")
	public String removeFromDisp(Case c, HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		int disp=c.getDisp();
		System.out.println("removeFromDisp : "+disp);
		
		Refri r= (Refri) session.getAttribute("r");
		System.out.println(service.getByDisp(disp, r));	
		service.editDisp(disp, 0, r);
		
		return "redirect:/case/listDisp";
	}

}
