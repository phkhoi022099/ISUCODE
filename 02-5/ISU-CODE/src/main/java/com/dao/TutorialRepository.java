package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bean.Tutorial;
@Repository
public interface TutorialRepository extends CrudRepository<Tutorial, Integer> {
	@Query(value="select * from tutorial where title like %:tutorialSearch%",nativeQuery = true)
	public List<Tutorial> searchTutorial(@Param(value = "tutorialSearch") String tutorialSearch);
}
