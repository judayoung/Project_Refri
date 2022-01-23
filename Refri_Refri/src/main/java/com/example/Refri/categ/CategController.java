package com.example.Refri.categ;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/categ/")
@Controller
public class CategController {
	
	private static final String path="C:\\project_img\\refri\\categ";
	//private static final String path="E:\\java\\img\\refri\\categ";
	
	@Autowired
	private CategService service;
	
	@RequestMapping("addOne")
	public String add(Categ c) {
		service.addCateg(c);
		Categ categ=service.getLast();
		
		saveImg(categ.getNum(),c.getFile());
		System.out.println("Categ add : "+categ);
		return "member/main";
	}

	
	public void saveImg(int num, MultipartFile file) {
		File dir=new File(path);
		
		if(!dir.exists() ) {
			dir.mkdir();
		}
		
		if(file!=null || !file.equals("")) {
			String fileName=file.getOriginalFilename();
			System.out.println(fileName);
			String[] arr=fileName.split("\\.");  //.으로 자를 때는 \\. 사용.
			System.out.println(arr[0]);
			String fileFormat=arr[arr.length-1];
			System.out.println(fileFormat);
			File f=new File(path+"\\"+num+"."+fileFormat);
			try {
				file.transferTo(f);
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	@RequestMapping("addSwitch")
	public ModelAndView addSwitch(HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		session.setAttribute("section", "categAdd");
		
		ModelAndView mav=new ModelAndView("member/main");
		return mav;
	}
	@RequestMapping("addCateg")
	public ModelAndView addCateg() {
		//go to addCateg form.
		ArrayList<String> list=service.getCates();
		ArrayList<String> nameList=service.getNames();
		ModelAndView mav=new ModelAndView("categ/addCateg","list",list);
		mav.addObject("nameList",nameList);
		return mav;
	}
	
	@RequestMapping("findByCate")
	public ModelAndView findByCate(@RequestParam("cate") String cate) {
		ArrayList<Categ> list=service.getByCate(cate);
		ModelAndView mav=new ModelAndView("json/categListJson","list",list);
		return mav;
	}
	
	

}
