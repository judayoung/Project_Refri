package com.example.Refri.rcase;

public class Case {

	private int num;
	private int r_num;
	private String name;
	private int disp;  //진열번호

	public Case(int num, int r_num, String name) {
		super();
		this.num = num;
		this.r_num = r_num;
		this.name = name;
	}
	
	

	public Case(int disp) {
		super();
		this.disp = disp;
	}



	public Case(int num, int disp) {
		super();
		this.num = num;
		this.disp = disp;
	}



	public int getDisp() {
		return disp;
	}



	public void setDisp(int disp) {
		this.disp = disp;
	}



	public Case(int num, int r_num, String name, int disp) {
		super();
		this.num = num;
		this.r_num = r_num;
		this.name = name;
		this.disp = disp;
	}



	public Case() {
		super();
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	@Override
	public String toString() {
		return "Case [num=" + num + ", r_num=" + r_num + ", name=" + name + ", disp=" + disp + "]";
	}

	

}
