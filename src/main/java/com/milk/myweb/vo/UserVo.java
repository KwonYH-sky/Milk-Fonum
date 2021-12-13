package com.milk.myweb.vo;

import java.sql.Timestamp;

public class UserVo {

	private String u_id;
	private String u_password;
	private String u_name;
	private String u_email;
	private String u_sex;
	private int u_birhday;
	private int u_phonenumber;
	private Timestamp u_regdate;
	private Timestamp u_latestlogindate;

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_password() {
		return u_password;
	}

	public void setU_password(String u_password) {
		this.u_password = u_password;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_sex() {
		return u_sex;
	}

	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}

	public int getU_birhday() {
		return u_birhday;
	}

	public void setU_birhday(int u_birhday) {
		this.u_birhday = u_birhday;
	}

	public int getU_phonenumber() {
		return u_phonenumber;
	}

	public void setU_phonenumber(int u_phonenumber) {
		this.u_phonenumber = u_phonenumber;
	}

	public Timestamp getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(Timestamp u_regdate) {
		this.u_regdate = u_regdate;
	}

	public Timestamp getU_latestlogindate() {
		return u_latestlogindate;
	}

	public void setU_latestlogindate(Timestamp u_latestlogindate) {
		this.u_latestlogindate = u_latestlogindate;
	}

	@Override
	public String toString() {
		return "UserVo [u_id=" + u_id + ", u_password=" + u_password + ", u_name=" + u_name + ", u_email=" + u_email
				+ ", u_sex=" + u_sex + ", u_birhday=" + u_birhday + ", u_phonenumber=" + u_phonenumber + ", u_regdate="
				+ u_regdate + ", u_latestlogindate=" + u_latestlogindate + "]";
	}

}
