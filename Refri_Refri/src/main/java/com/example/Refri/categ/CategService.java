package com.example.Refri.categ;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategService {
	
	private static final String path="D:\\java\\img\\refri\\food";
	//private static final String path="E:\\java\\img\\refri\\food";
	
	@Autowired
	private CategMapper mapper;
	
	
	public void addCateg(Categ c) {
		mapper.insert(c);
	}
	public Categ getCateg(int num) {
		return mapper.select(num);
	}
	public ArrayList<Categ> getAll(){
		return mapper.selectAll();		
	}
	public ArrayList<Categ> getByCate(String cate){
		ArrayList<Categ> resultList=new ArrayList<Categ>();
		ArrayList<String> strList=new ArrayList<String>();
		
		ArrayList<Categ> list=mapper.selectByCate(cate);
		for(int i=0;i<list.size();i++) {
			Categ c=list.get(i);
			String name=c.getName();
			if(!strList.contains(name) && name!=null && !name.equals("")) {
				strList.add(name);
				resultList.add(c);
			}
		}
		return resultList;
	}
	
	
	
	
	
	public ArrayList<String> getCates(){
		ArrayList<String> resultList=new ArrayList<String>();
		
		ArrayList<Categ> list=getAll();
		for(int i=0;i<list.size();i++) {
			String cate=list.get(i).getCate();
			if(!resultList.contains(cate) && cate!=null && !cate.equals("")) {
				resultList.add(cate);
			}
		}
		return resultList;
	}
	public ArrayList<String> getNames(){
		ArrayList<String> resultList=new ArrayList<String>();
		
		ArrayList<Categ> list=getAll();
		for(int i=0;i<list.size();i++) {
			String name=list.get(i).getName();
			if(!resultList.contains(name) && name!=null && !name.equals("")) {
				resultList.add(name);
			}
		}
		return resultList;
	}
	
	public ArrayList<String> printImgs() {
		ArrayList<String> list=new ArrayList<String>();
		
		int count=0;
		System.out.println("Categ imgs : \n---------------------");
		
		File dir=new File(path);
		if(dir.exists() && dir.list().length>0) {
			String[] fileNames=dir.list();
			for(int i=0;i<fileNames.length;i++) {
				String fileName=fileNames[i];
				System.out.print("    "+fileName);
						
				list.add(fileName);
				count++;
			}
		}		
		
		System.out.println("\n---------------------"+count);
		return list;
	}
	
	public Categ getLast() {
		ArrayList<Categ> list=getAll();
		return list.get(list.size()-1);
	}

}
