package com;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.controllers.UserController;

@SpringBootTest
class ISUCODETest {

	@Autowired UserController userController;
	@Test
	void contextLoads() {
		
	   System.out.println("hhhh");
	}

}
