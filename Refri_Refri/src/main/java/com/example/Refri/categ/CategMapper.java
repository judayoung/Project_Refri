package com.example.Refri.categ;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategMapper {
	
	void insert(Categ c);
	Categ select(int num);
	ArrayList<Categ> selectAll();
	ArrayList<Categ> selectByCate(String cate);

}
