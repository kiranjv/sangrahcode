package com.java.sangrah.repos;

import java.util.List;

import com.java.sangrah.controllers.DBLocalHelper;
import com.java.sangrah.models.User;
import com.java.sangrah.models.VtigerUsers;

public class HUserRepo {
	public VtigerUsers getUserDetails(String username) {
		String hsql = "from VtigerUsers where userName = '"+username+"' ";
		List<VtigerUsers> records = DBLocalHelper.executeHQuery(hsql);
		if (records.size() > 0) {
			VtigerUsers user = records.get(0);
			return user;
		}
		return null;
	}
	public static void main(String[] args) {
//		VtigerUsers userDetails = new HUserRepo().getUserDetails("admin");
//		System.out.println(userDetails.toString());
		
		String hsql = "from VtigerUsers where userName = 'admin' ";
		List<VtigerUsers> records = DBLocalHelper.executeHQuery(hsql);
		//List<VtigerUsers> records = DBLocalHelper.readRecords("VtigerUsers");
		for (int i = 0; i < records.size(); i++) {
			System.out.println("username: "+records.get(i).getUserName());
			
		}
	}
}
