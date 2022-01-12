package com.example.Refri;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class RefriApplication extends SpringBootServletInitializer {

	// war 배포를 위한 소스
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(RefriApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(RefriApplication.class, args);
	}

}
