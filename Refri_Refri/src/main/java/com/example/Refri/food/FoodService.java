package com.example.Refri.food;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodService {
	
	@Autowired
	private FoodMapper mapper;
	
	public void addFood(Food f) {
		mapper.insert(f);
	}
	public Food getFood(int num) {
		return mapper.select(num);
	}
	public ArrayList<Food> getByCase(int c_num){
		return mapper.selectByCase(c_num);
	}
	public ArrayList<Food> getAll(){
		return mapper.selectAll();
	}
	public void delFood(int num) {
		mapper.delete(num);
	}
	
	
	
	public ArrayList<Integer> getNumsByCase(int c_num){
		ArrayList<Integer> numList=new ArrayList<Integer>();
		
		ArrayList<Food> list=getByCase(c_num);
		for(int i=0;i<list.size();i++) {
			int num=list.get(i).getNum();
			numList.add(num);		
		}
		
		return numList;
		
	}
	
	public Food getLast() {
		ArrayList<Food> list=getAll();
		return list.get(list.size()-1);
	}
	
	
	
	
	
	

}
