package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bean.Post;
import com.bean.Questions;

@Repository
public interface QuestionRepo extends CrudRepository<Questions, Integer> {
	@Query("FROM Questions q where q.userEmail=:userEmail") 
	  public List<Questions> findByEmail(@Param("userEmail") String userEmail);
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update Questions q set q.helpful = :helpful where q.qid = :qid")
	void changeHelpful(@Param(value = "helpful") String helpful, @Param(value = "qid") int qid);
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update Questions q set q.unhelpful = :unhelpful where q.qid = :qid")
	void changeUnHelpful(@Param(value = "unhelpful") String unhelpful, @Param(value = "qid") int qid);
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update Questions q set q.answer = :answer where q.qid = :qid")
	void saveOrUpdateAnswer(@Param(value = "answer") String answer, @Param(value = "qid") int qid);
	
	
}
