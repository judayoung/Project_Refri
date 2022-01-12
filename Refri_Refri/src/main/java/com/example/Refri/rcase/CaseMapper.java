package com.example.Refri.rcase;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CaseMapper {
	
	void insert(Case c);
	Case select(int num);
	ArrayList<Case> selectByRefri(int r_num);
	ArrayList<Case> selectById(ArrayList<Integer> list);
	void update(Case c);
	void delete(int num);

}
