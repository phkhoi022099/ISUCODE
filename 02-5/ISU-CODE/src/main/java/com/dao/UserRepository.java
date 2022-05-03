package com.dao;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.bean.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	@Query("FROM User u where u.email=:email") 
	  public User findByEmail(@Param("email") String email);
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update User u set u.status = :status where u.id = :id")
	void changeUserStatus(@Param(value = "id") int id, @Param(value = "status") String status);
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update User u set u.role = :role where u.id = :id")
	void changeUserRole(@Param(value = "id") int id, @Param(value = "role") String role);
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update User u set u.password = :password where u.email = :email")
	void changeUserPassword(@Param(value = "email") String email, @Param(value = "password") String password);
}
