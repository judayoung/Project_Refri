package com.example.Refri.refri;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/refri/")
@Controller
public class RefriController {
	
	@Autowired
	private RefriService service;
	
	private static final String path="D:\\java\\img\\refri";
	//private static final String path="E:\\java\\img\\refri";
	private static final String defaultImg="img_refri_1.jpg";

	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		String id=(String) session.getAttribute("id");
		ArrayList<Refri> list=service.getRefris(id);
		
		ModelAndView mav=new ModelAndView("refri/list","list",list);
		return mav;
	}
	
	@RequestMapping("img")
	public ResponseEntity<byte[]> imgload(@RequestParam("num") int num){
		if(num==0) {
			File img=new File(path+"\\"+defaultImg);
			
			HttpHeaders header=new HttpHeaders();
			ResponseEntity<byte[]> res_ent=null;
			try {
				res_ent=new ResponseEntity<>(FileCopyUtils.copyToByteArray(img),
						header, HttpStatus.OK);
			}catch(IOException e) {
				e.printStackTrace();
			}
			return res_ent;
		}
		return null;
	}
	
	@RequestMapping("addSwitch")
	public ModelAndView addSwitch(HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		session.setAttribute("section", "refriAdd");
		
		ModelAndView mav=new ModelAndView("member/main");
		return mav;
	}
	
	@RequestMapping("addRefri")
	public void addRefri() {
		//go to addrefri form.
	}
	
	@RequestMapping("add")
	public String add(@RequestParam("name") String name, HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		String id=(String) session.getAttribute("id");
		Refri r=new Refri(0,id,name,1);
		service.addRefri(r);
		
		// 마지막에 추가한 냉장고를 세션에 세팅한다.
		r=service.getLast(id);
		session.setAttribute("r", r);
		System.out.println("add : "+r);
		
		session.setAttribute("section","refriList");
		return "member/main";
	}
	
	@RequestMapping("listSwitch")
	public ModelAndView listSwitch(HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		session.setAttribute("section", "refriList");
		
		ModelAndView mav=new ModelAndView("member/main");
		return mav;
	}
	
	

}
