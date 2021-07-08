package com.project.controller.action;

public class ActionForward {
	
	private String path;
	private boolean redirect;
	
	//construct
	public ActionForward() {
		
	}
	
	public ActionForward(String path, boolean redirect) {
		this.path=path;
		this.redirect=redirect;
	}
	//get, set Attributes
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
}
