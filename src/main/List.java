package main;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;

import com.opensymphony.xwork2.ActionSupport;

public class List extends ActionSupport{
	private String originalUri = "";
	
	private String uri;
	public String getUri(){
		return uri;
	}
	
	public String getOriginalUri() {
		return originalUri;
	}

	public void setOriginalUri(String originalUri) {
		this.originalUri = originalUri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}
	
	public ArrayList<File> getFileArrayList() {
		return fileArrayList;
	}

	public void setFileArrayList(ArrayList<File> fileArrayList) {
		this.fileArrayList = fileArrayList;
	}

	public File[] getFileArray() {
		return fileArray;
	}

	public void setFileArray(File[] fileArray) {
		this.fileArray = fileArray;
	}

	private ArrayList<File> fileArrayList = new ArrayList<File>();
	private File[] fileArray = null;
	
	public String execute() throws Exception{
		uri = originalUri.length()==0?"/root/git/gxmty-onlineReading":URLDecoder.decode(originalUri, "UTF-8");
		System.out.println(uri);
		
		fileArray = null;
		fileArray = new File(uri).listFiles();
		System.out.println(fileArray.length);
		
		fileArrayList.clear();
		try{
			Collections.addAll(fileArrayList, fileArray);
		}catch(Exception e){
			System.out.println(e);
		}
		
		return SUCCESS;
	}
}
