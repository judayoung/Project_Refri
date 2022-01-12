package com.example.Refri.refri;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RefriMapper {
	
	void insert(Refri r);
	Refri select(int num);
	ArrayList<Refri> selectAll(String id);

}
