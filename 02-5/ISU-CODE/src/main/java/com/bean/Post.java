package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int pid;
	@Column(length=3000)
	private String post;
	private String postEmail;
	@ManyToOne(targetEntity = Questions.class,fetch = FetchType.EAGER)
	private Questions questioin;
	
	public Questions getQuestioin() {
		return questioin;
	}
	public void setQuestioin(Questions questioin) {
		this.questioin = questioin;
	}
	public String getPostEmail() {
		return postEmail;
	}
	public void setPostEmail(String postEmail) {
		this.postEmail = postEmail;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	

}
