package main;

import java.io.File;

import com.opensymphony.xwork2.ActionSupport;

public class List extends ActionSupport{
	private String posturi;
	private String uri = posturi.length()==0?"/home/elvis/编程":posturi;

	public String execute(){
		File[] fileList = new File(uri).listFiles();
		return SUCCESS;
	}
}
