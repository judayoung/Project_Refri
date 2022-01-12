package com.example.Refri.food;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Food {

	private int num;
	private int c_num; // case number
	private String cate;
	private String name;
	private long quan;
	private String unit;
	private String info;
	private Date up_date;
	private Date shelfdate;
	private Date usedate;

	private MultipartFile file;

	public Food(int num, int c_num, String cate, String name, long  quan, String unit, String info, Date up_date,
			Date shelfdate, Date usedate) {
		super();
		this.num = num;
		this.c_num = c_num;
		this.cate = cate;
		this.name = name;
		this.quan = quan;
		this.unit = unit;
		this.info = info;
		this.up_date = up_date;
		this.shelfdate = shelfdate;
		this.usedate = usedate;
	}

	public Food() {
		super();
	}

	public Food(int num, int c_num, String cate, String name, long  quan, String unit, String info, Date up_date,
			Date shelfdate, Date usedate, MultipartFile file) {
		super();
		this.num = num;
		this.c_num = c_num;
		this.cate = cate;
		this.name = name;
		this.quan = quan;
		this.unit = unit;
		this.info = info;
		this.up_date = up_date;
		this.shelfdate = shelfdate;
		this.usedate = usedate;
		this.file = file;
	}

	public Food(int num, String name) {
		super();
		this.num = num;
		this.name = name;
	}

	public Food(int num, int c_num, String cate, String name, long  quan, String unit, String info) {
		super();
		this.num = num;
		this.c_num = c_num;
		this.cate = cate;
		this.name = name;
		this.quan = quan;
		this.unit = unit;
		this.info = info;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
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

	

	public long getQuan() {
		return quan;
	}

	public void setQuan(long quan) {
		this.quan = quan;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getUp_date() {
		return up_date;
	}

	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}

	public Date getShelfdate() {
		return shelfdate;
	}

	public void setShelfdate(Date shelfdate) {
		this.shelfdate = shelfdate;
	}

	public Date getUsedate() {
		return usedate;
	}

	public void setUsedate(Date usedate) {
		this.usedate = usedate;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Food [num=" + num + ", c_num=" + c_num + ", cate=" + cate + ", name=" + name + ", quan=" + quan
				+ ", unit=" + unit + ", info=" + info + "    \n, up_date=" + up_date + ", shelfdate=" + shelfdate
				+ ", usedate=" + usedate + "    \n, file=" + file + "]";
	}

}
