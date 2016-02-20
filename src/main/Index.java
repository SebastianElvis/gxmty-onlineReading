package main;

import com.opensymphony.xwork2.ActionSupport;

public class Index extends ActionSupport{
	public String execute() throws InterruptedException{
		Thread.sleep(500);
		System.out.println("fuck you");
		return SUCCESS;
	}
	
}