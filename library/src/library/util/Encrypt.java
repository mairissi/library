package library.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class Encrypt {
	
	public static String generateHash(String email, String password) {
		String concat = email + password;
		try {
			StringBuffer encrypted = new StringBuffer();			
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(concat.getBytes(StandardCharsets.UTF_8));
			for(int i=0; i<hash.length; i++) {
				encrypted.append(hash[i]);
			}
			return encrypted.toString();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
