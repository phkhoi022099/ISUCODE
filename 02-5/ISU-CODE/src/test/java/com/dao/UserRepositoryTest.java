package com.dao;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.bean.User;

@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class UserRepositoryTest {
     @Autowired UserRepository userRepository;
	
	@Test
	void testFindByEmail() {
		User user = userRepository.findByEmail("sandeep@gmail.com");
		assertThat(user.getEmail()).isEqualTo("sandeep@gmail.com");
	}

	@Test
	void testChangeUserStatus() {
		User u=null;
		userRepository.changeUserStatus(6, "disable");
		Optional<User> user = userRepository.findById(6);
		if(user.isPresent())
			u=user.get();
		assertThat(u.getStatus()).isEqualTo("disable");
	}

	@Test
	void testChangeUserRole() {
		User u=null;
		userRepository.changeUserRole(6, "admin");
		Optional<User> user = userRepository.findById(6);
		if(user.isPresent())
			u=user.get();
		assertThat(u.getRole()).isEqualTo("admin");
	}

	@Test
	void testChangeUserPassword() {
		User u=null;
		userRepository.changeUserPassword("test@gmail.com", "456");
		Optional<User> user = userRepository.findById(6);
		if(user.isPresent())
			u=user.get();
		assertThat(u.getPassword()).isEqualTo("456");
	}

}
