package com.dao;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.bean.Questions;
import com.bean.User;
@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class QuestionRepoTest {
	@Autowired QuestionRepo questionRepo;
	@Test
	void testFindByEmail() {
		List<Questions> q = questionRepo.findByEmail("test@gmail.com");
		for(Questions ques:q)
		{
			if(ques.equals("test@gmail.com"))
				assertThat(ques.getHelpful()).isEqualTo(5);
		}
	}

	@Test
	void testChangeHelpful() {
		Questions question=null;
		questionRepo.changeHelpful("6", 8);
		Optional<Questions> ques = questionRepo.findById(8);
		if(ques.isPresent())
			question=ques.get();
		assertThat(question.getHelpful()).isEqualTo("6");
	}

	@Test
	void testChangeUnHelpful() {
		Questions question=null;
		questionRepo.changeUnHelpful("6", 8);
		Optional<Questions> ques = questionRepo.findById(8);
		if(ques.isPresent())
			question=ques.get();
		assertThat(question.getUnhelpful()).isEqualTo("6");
	}

	@Test
	void testSaveOrUpdateAnswer() {
		Questions question=null;
		  questionRepo.saveOrUpdateAnswer("your answer",8); 
		  Optional<Questions> ques = questionRepo.findById(8);
		  if(ques.isPresent())
			  question=ques.get(); 
			  
		  assertThat(question.getAnswer()).isEqualTo("your answer");
		 
	}

}
