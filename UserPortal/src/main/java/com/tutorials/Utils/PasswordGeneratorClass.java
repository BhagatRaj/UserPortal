package com.tutorials.Utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public abstract class PasswordGeneratorClass {

	/*
	public static String getMd5Password(String password) {
		String hashword = null;
		System.out.println("getMd5Password password=" + password);
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(password.getBytes());
			BigInteger hash = new BigInteger(1, md5.digest());
			hashword = hash.toString(16);

		} catch (NoSuchAlgorithmException nsae) {

		}
		return hashword;
	}*/
	
	public static boolean checkPassword(String enteredpassword,
			String dbpassword) {
		System.out.println("enteredpassword=" + enteredpassword
				+ " & dbpassword=" + (enteredpassword));
		return dbpassword.equals((enteredpassword)) ? true
				: false;
	}
}
