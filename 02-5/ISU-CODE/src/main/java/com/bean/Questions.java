package com.bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Questions implements Comparable<Questions> {
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private int qid;
@Lob
@Column(length=3000)
private String question;
@Column(length=6000)
private String answer;

private String userEmail;
private String helpful;
private String unhelpful;
@OneToMany(cascade = CascadeType.ALL,mappedBy = "questioin" )
private List<Post> posts;
public List<Post> getPosts() {
	return posts;
}


public void setPosts(List<Post> posts) {
	this.posts = posts;
}


public int getQid() {
	return qid;
}


public void setQid(int qid) {
	this.qid = qid;
}


public String getQuestion() {
	return question;
}


public void setQuestion(String question) {
	this.question = question;
}


public String getAnswer() {
	return answer;
}


public void setAnswer(String answer) {
	this.answer = answer;
}


public String getUserEmail() {
	return userEmail;
}


public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}


public String getHelpful() {
	return helpful;
}


public void setHelpful(String helpful) {
	this.helpful = helpful;
}


public String getUnhelpful() {
	return unhelpful;
}


public void setUnhelpful(String unhelpful) {
	this.unhelpful = unhelpful;
}


@Override
public int compareTo(Questions ques) {
	if(this.qid==ques.qid)  
		return 0;  
		else if(this.qid>ques.qid)  
		return 1;  
		else  
		return -1;  
}

}
