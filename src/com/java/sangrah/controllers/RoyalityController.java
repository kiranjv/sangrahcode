package com.java.sangrah.controllers;

import java.util.List;

import com.java.sangrah.models.VtigerContactdetails;
import com.java.sangrah.models.VtigerContactroyality;

public class RoyalityController {

	public VtigerContactroyality readContactRoyality(String royalitynumber) {
		String modelname = VtigerContactroyality.class.getSimpleName();

		List<VtigerContactroyality> contactroyalitys = DBLocalHelper.readRecord(modelname, "royalitynumber", royalitynumber);
		if (contactroyalitys.size() != 0) {
			return contactroyalitys.get(0);
		}
		return null;
	}
	
	
	public VtigerContactdetails readContactDetails(int contactid) {
		String modelname = VtigerContactdetails.class.getSimpleName();
		List<VtigerContactdetails> contacts = DBLocalHelper.readRecord(modelname, "contactid", contactid);
		if (contacts.size() != 0) {
			return contacts.get(0);
		}
		return null;
	}
}
