package com.milk.myweb.vo;

import java.sql.Timestamp;

public class BoardReplyVo {

	private int re_num;
	private int b_num;
	private String re_content;
	private String re_writer;
	private Timestamp re_reg_date;
	private Timestamp re_update_date;

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_writer() {
		return re_writer;
	}

	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}

	public Timestamp getRe_reg_date() {
		return re_reg_date;
	}

	public void setRe_reg_date(Timestamp re_reg_date) {
		this.re_reg_date = re_reg_date;
	}
	
	public Timestamp getRe_update_date() {
		return re_update_date;
	}

	public void setRe_update_date(Timestamp re_update_date) {
		this.re_update_date = re_update_date;
	}

	@Override
	public String toString() {
		return "BoardReplyVo [re_num=" + re_num + ", b_num=" + b_num + ", re_content=" + re_content + ", re_writer="
				+ re_writer + ", re_reg_date=" + re_reg_date + ", re_update_date=" + re_update_date + "]";
	}

}
