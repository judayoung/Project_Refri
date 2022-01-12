package com.example.Refri.food;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.TreeSet;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.Refri.categ.Categ;
import com.example.Refri.categ.CategService;
import com.example.Refri.rcase.Case;
import com.example.Refri.rcase.CaseSevice;
import com.example.Refri.refri.Refri;


@RequestMapping("/food/")
@Controller
public class FoodController {
	
	private static final String path="D:\\java\\img\\refri\\food";
	//private static final String path="E:\\java\\img\\refri\\food";
	
	@Autowired 
	private FoodService service;
	
	@Autowired
	private CaseSevice c_service;
	
	@Autowired
	private CategService t_service;
	
	
	
	@RequestMapping("addFood")
	public ModelAndView addFood(@RequestParam("c_num") int c_num) {
		// go to addFood form.
		Case c=c_service.getCase(c_num);
		
		// 1. 날짜
		// 날짜 형식이 util.Date 와 sql.Date 2개다. 
		// 출처 : https://www.delftstack.com/ko/howto/java/java-util-date-to-java-sql-date/		
		java.sql.Date sqldate=new java.sql.Date(new java.util.Date().getTime());
		System.out.println("Today's sql Date : "+sqldate);
		java.sql.Date defaultDay=new java.sql.Date(0);
		
		// 2. 카테고리 리스트
		ArrayList<Categ> categList=t_service.getAll();
		ArrayList<String> imgList=t_service.printImgs();

		ArrayList<String> cateSet=t_service.getCates();
		System.out.println(cateSet);
		
		ModelAndView mav=new ModelAndView("food/addFood","c",c);
		mav.addObject("today",sqldate);
		mav.addObject("defaultDay", defaultDay);
		mav.addObject("closeFlag",false);
		mav.addObject("categList", categList);
		mav.addObject("imgList", imgList);
		mav.addObject("cateSet", cateSet);
		return mav;
	}
	
	/*
	@RequestMapping("changeDate")
	public ModelAndView changeDate(String date) {
		int dte=Integer.parseInt(date);
		java.sql.Date newDate=new java.sql.Date(new java.util.Date().getTime()+dte*1000*60*60*24);
		
		System.out.println(newDate);
		ModelAndView mav=new ModelAndView("json/dateJson","newDate",newDate.toString());
		return mav;
	} */
	
	@RequestMapping("img")
	public ResponseEntity<byte[]> imgload(@RequestParam("num") int num){
		String img="";
		
		File dir=new File(path);
		if(dir.exists() ) {
			String[] fileNames=dir.list();
			for(int i=0;i<fileNames.length;i++) {				String fileName=fileNames[i].split("\\.")[0];

				if(num==Integer.parseInt(fileName) ) {
					img=fileNames[i];
					break;
				}
			}
		}
		img=(img.equals(""))? "0.jpg":img;
		
		File imgFile=new File(path+"\\"+img);
		
		HttpHeaders header=new HttpHeaders();
		ResponseEntity<byte[]> res_ent=null;
		try {
			res_ent=new ResponseEntity<>(FileCopyUtils.copyToByteArray(imgFile),
					header, HttpStatus.OK);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return res_ent;
	}
	@RequestMapping("imgExist")
	public ResponseEntity<byte[]> imgExistload(String filename){
		File imgFile=new File(path+"\\"+filename);
		
		HttpHeaders header=new HttpHeaders();
		ResponseEntity<byte[]> res_ent=null;
		try {
			res_ent=new ResponseEntity<>(FileCopyUtils.copyToByteArray(imgFile),
					header, HttpStatus.OK);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return res_ent;
	}
	
	@RequestMapping("addOne")
	public ModelAndView add(Food f) {
		service.addFood(f);
		int num=service.getLast().getNum();
		
		saveImg(num,f.getFile());
		System.out.println("food add : "+f);
		
		ModelAndView mav=new ModelAndView("food/addFood","closeFlag",true);
		return mav;
	}
	
	public void saveImg(int num, MultipartFile file) {
		System.out.println(file.getOriginalFilename());
		
			// make directory folder
			File dir=new File(path);
			if(!dir.exists()) {
				dir.mkdir();
			}
		
		if(file!=null && !file.equals("")) {
			// make img file
			String fileName=file.getOriginalFilename();
			String[] arr=fileName.split("\\.");
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
	
	
	@RequestMapping("del")
	public String del(Food food) {
		int num=food.getNum();
		service.delFood(num);
		
		File dir=new File(path);
		if(dir.exists() ) {
			String[] fileNames=dir.list();
			for(int i=0;i<fileNames.length;i++) {
				String[] arr=fileNames[i].split("\\.");
				String fileName=arr[0];
				
				if(num==Integer.parseInt(fileName)) {
					System.out.println(fileNames[i]);
					File f=new File(path+"\\"+fileNames[i]);
					f.delete();
					break;
				}
			}
		}
		
		return "member/main";
	}

}
