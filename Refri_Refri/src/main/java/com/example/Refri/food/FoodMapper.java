package com.example.Refri.food;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FoodMapper {
	
	void insert(Food f);   
	Food select(int num);
	ArrayList<Food> selectByCase(int c_num);
	ArrayList<Food> selectAll();
	void delete(int num);

}
