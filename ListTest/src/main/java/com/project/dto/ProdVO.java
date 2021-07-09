package com.project.dto;

import java.sql.Timestamp;

public class ProdVO {
	private int index;
	private String serial_num;
	private String prod_nm;
	private String prod_pswd;
	private String comp_nm;
	private String prod_date;
	private String prod_local;
	private String prod_country;
	private Timestamp reg_date;
	private String reg_id;
	private Timestamp prod_lastdate;
	
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getSerial_num() {
		return serial_num;
	}
	public void setSerial_num(String serial_num) {
		this.serial_num = serial_num;
	}
	public String getProd_nm() {
		return prod_nm;
	}
	public void setProd_nm(String prod_nm) {
		this.prod_nm = prod_nm;
	}
	public String getProd_pswd() {
		return prod_pswd;
	}
	public void setProd_pswd(String prod_pswd) {
		this.prod_pswd = prod_pswd;
	}
	public String getComp_nm() {
		return comp_nm;
	}
	public void setComp_nm(String comp_nm) {
		this.comp_nm = comp_nm;
	}
	public String getProd_date() {
		return prod_date;
	}
	public void setProd_date(String prod_date) {
		this.prod_date = prod_date;
	}
	public String getProd_local() {
		return prod_local;
	}
	public void setProd_local(String prod_local) {
		this.prod_local = prod_local;
	}
	public String getProd_country() {
		return prod_country;
	}
	public void setProd_country(String prod_country) {
		this.prod_country = prod_country;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public Timestamp getProd_lastdate() {
		return prod_lastdate;
	}
	public void setProd_lastdate(Timestamp prod_lastdate) {
		this.prod_lastdate = prod_lastdate;
	}
	
	
	
}
