package com.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Tutorial {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int tid;
	private String tname;
	private String[] title;
	@Column(length=3000)
	private String[] tdesc;
	public Tutorial() {
		
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String[] getTitle() {
		return title;
	}
	public void setTitle(String[] title) {
		this.title = title;
	}
	public String[] getTdesc() {
		return tdesc;
	}
	public void setTdesc(String[] tdesc) {
		this.tdesc = tdesc;
	}
	
	
}
