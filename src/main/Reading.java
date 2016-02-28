package main;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import com.opensymphony.xwork2.ActionSupport;

public class Reading extends ActionSupport{
	private String uri;
	
	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}
	
	private String decodedUri;

	public String getDecodedUri() {
		return decodedUri;
	}

	public void setDecodedUri(String decodedUri) {
		this.decodedUri = decodedUri;
	}

	public String execute() throws Exception{
		//decodedUri = URLDecoder.decode(uri, "UTF-8");
		return SUCCESS;
	}
}
