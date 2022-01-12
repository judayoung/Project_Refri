package com.example.Refri.mem;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RefrimemMapper {
	
	Refrimem select(String id);
	

}
