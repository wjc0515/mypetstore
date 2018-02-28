package com.unitech.petstore.persistence;

import org.springframework.stereotype.Repository;

import com.unitech.petstore.domain.Account;

@Repository
public interface AccountMapper {

	Account getAccountByUserId(String userid);

	Account getAccountByUserIdAndPassword(Account account);

	void insertAccount(Account account);

	void insertProfile(Account account);

	void insertSignon(Account account);

	void updateAccount(Account account);

	void updateProfile(Account account);

	void updateSignon(Account account);

}
