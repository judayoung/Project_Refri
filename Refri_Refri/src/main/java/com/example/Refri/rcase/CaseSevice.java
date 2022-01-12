package com.example.Refri.rcase;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Refri.refri.Refri;
import com.example.Refri.refri.RefriService;

@Service
public class CaseSevice {
	
	@Autowired
	private CaseMapper mapper;
	
	private RefriService service;
	
	public void addCase(Case c) {
		mapper.insert(c);
	}
	public Case getCase(int num) {
		return mapper.select(num);
	}
	public ArrayList<Case> getByRefri(int r_num){
		return mapper.selectByRefri(r_num);
	}
	public ArrayList<Case> getByRefri(Refri r){
		return mapper.selectByRefri(r.getNum());
	}
	
	public ArrayList<Case> getById(String id){
		ArrayList<Refri> r_list=service.getRefris(id);
		ArrayList<Integer> list=new ArrayList<Integer>();
		for(int i=0;i<r_list.size();i++) {
			list.add(r_list.get(i).getNum());
		}
		return mapper.selectById(list);
	}
	
	public void editCase(Case c) {
		mapper.update(c);
	}
	public void delCase(int num) {
		mapper.delete(num);
	}
	
	
	
	
	public void editDisp(int disp, int newdisp, Refri r) {
		Case c=getByDisp(disp,r);
		if(c!=null) {
			c.setDisp(newdisp);	
			mapper.update(c);
		}		
	}
	
	public Case getByDisp(int disp, Refri r) {
		ArrayList<Case> list=getByRefri(r.getNum());
		Case c=null;
		for(int i=0;i<list.size();i++) {
			if(disp==list.get(i).getDisp() ) {
				c=list.get(i);					
			}
		}
		return c;
	}

}
