package com.example.Refri.refri;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefriService {
	
	@Autowired
	private RefriMapper mapper;
	
	public void addRefri(Refri r) {
		mapper.insert(r);
	}
	public Refri getRefri(int num) {
		return mapper.select(num);
	}
	public ArrayList<Refri> getRefris(String id){
		return mapper.selectAll(id);
	}
	
	
	
	
	public boolean isRefri(String id) {
		ArrayList<Refri> list=getRefris(id);
		if(list.isEmpty()) {
			return false;
		}else {
			return true;
		}
	}
	
	public Refri getFirst(String id) {
		ArrayList<Refri> list=getRefris(id);
		return list.get(0);
	}
	public Refri getLast(String id) {
		ArrayList<Refri> list=getRefris(id);
		return list.get(list.size()-1);
	}


}
