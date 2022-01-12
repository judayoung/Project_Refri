package com.example.Refri.categ;

import org.springframework.web.multipart.MultipartFile;

public class Categ {

	private int num;
	private String cate;
	private String name;

	private MultipartFile file;

	public Categ(int num, String cate, String name) {
		super();
		this.num = num;
		this.cate = cate;
		this.name = name;
	}

	public Categ(int num, String cate, String name, MultipartFile file) {
		super();
		this.num = num;
		this.cate = cate;
		this.name = name;
		this.file = file;
	}

	public Categ() {
		super();
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Categ [num=" + num + ", cate=" + cate + ", name=" + name + ", file=" + file + "]";
	}

}
