package com.example.Refri.refri;

public class Refri {

	private int num;
	private String id;
	private String name;
	private int type;

	public Refri(int num, String id, String name) {
		super();
		this.num = num;
		this.id = id;
		this.name = name;
	}

	public Refri(int num, String id, String name, int type) {
		super();
		this.num = num;
		this.id = id;
		this.name = name;
		this.type = type;
	}



	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Refri() {
		super();
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Refri [num=" + num + ", id=" + id + ", name=" + name + ", type=" + type + "]";
	}

}
