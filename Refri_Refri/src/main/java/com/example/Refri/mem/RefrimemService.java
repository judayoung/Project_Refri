package com.example.Refri.mem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefrimemService {
	
	@Autowired
	private RefrimemMapper mapper;
	
	public Refrimem getMember(String id) {
		return mapper.select(id);
	}
	
	public String login(String id, String pwd) {
		Refrimem m=getMember(id);
		
		String result="아이디가 존재하지 않습니다.";
		if(m!=null) {
			result="비밀번호가 틀렸습니다.";
			if(pwd.equals(m.getPwd())) {
				result="";
			}
		}
		return result;
	}
	

}
