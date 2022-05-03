package com.dao;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.bean.OTPTable;
@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class OTPRepoTest {
    @Autowired OTPRepo oTPRepo;
	@Test
	void testGetMaxTransactionId() {
		int maxid = oTPRepo.getMaxTransactionId("test@gmail.com");
		int maxid1=0;
		List<OTPTable> otpList = (List<OTPTable>) oTPRepo.findAll();
		for(OTPTable otpT:otpList)
		{
			boolean otpstatus=otpT.getOpid()>maxid1;
			boolean email = otpT.getEmail().equals("test@gmail.com");
			if(otpstatus&&email )
				maxid1=otpT.getOpid();
		}
		assertThat(maxid).isEqualTo(maxid1);
	}

}
