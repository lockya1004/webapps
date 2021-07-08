package com.project.dto;

import java.sql.Timestamp;

public class AdminVO {
	private String adm_id;
	private String adm_email;
	private String adm_name;
	private String adm_pswd;
	private String adm_local;
	private String adm_country;
	private int adm_type;
	private Timestamp reg_date;
	
	public String getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}
	public String getAdm_email() {
		return adm_email;
	}
	public void setAdm_email(String adm_email) {
		this.adm_email = adm_email;
	}
	public String getAdm_name() {
		return adm_name;
	}
	public void setAdm_name(String adm_name) {
		this.adm_name = adm_name;
	}
	public String getAdm_pswd() {
		return adm_pswd;
	}
	public void setAdm_pswd(String adm_pswd) {
		this.adm_pswd = adm_pswd;
	}
	public String getAdm_local() {
		return adm_local;
	}
	public void setAdm_local(String adm_local) {
		this.adm_local = adm_local;
	}
	public String getAdm_country() {
		return adm_country;
	}
	public void setAdm_country(String adm_country) {
		this.adm_country = adm_country;
	}
	public int getAdm_type() {
		return adm_type;
	}
	public void setAdm_type(int adm_type) {
		this.adm_type = adm_type;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
}
