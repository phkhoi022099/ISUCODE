package com.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bean.OTPTable;

@Repository
public interface OTPRepo extends CrudRepository<OTPTable, Integer> {

	@Query(value = "SELECT max(opid) FROM OTPTable where otp.email=:email")
	int getMaxTransactionId(@Param("email") String email);
	
}
