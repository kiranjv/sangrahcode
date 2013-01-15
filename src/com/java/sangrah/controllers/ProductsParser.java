package com.java.sangrah.controllers;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import com.java.sangrah.models.VtigerProducts;
import com.java.sangrah.repos.HCrmEntityRepository;

public class ProductsParser {

	private String VAT = "vat";
	private String PRODUCTNAME = "productname";
	private String BARCODE = "barcode";
	private String CATEGORY = "category";
	private String UNITPRICE = "unitprice";
	private String DISCOUNT = "discount";
	private String NETPRICE = "netprice";
	private String CATEGORYID = "categoryid";
	private String COST = "costprice";

	public JsonArray readJsonArray(InputStreamReader streamreader) {
		
		JsonParser parser = new JsonParser();
		JsonElement parse = parser.parse(streamreader);
		JsonObject json = parse.getAsJsonObject();
		System.out.println(json.toString());

		// read products array
		return json.getAsJsonArray("products");
	}
	
	public JsonArray getJsonArray(JsonObject json, String name) {
		// read products array
				return json.getAsJsonArray(name);
	}

	public HashMap<String, String>[] readProductsList(JsonArray jsonArray) {
		int arrysize = jsonArray.size();
		System.out.println("Array size: " + arrysize);

		// read each product from array
		HashMap<String, String>[] products = new HashMap[arrysize];
		for (int i = 0; i < arrysize; i++) {
			System.out.println("-----------Product " + i + "---------------------");
			HashMap<String, String> product = new HashMap<String, String>();

			try {
				JSONObject jsonObject = new JSONObject(jsonArray.get(i).toString());
				product.put("productid", jsonObject.getString("productid"));
				product.put(PRODUCTNAME, jsonObject.getString("productname"));
				product.put(BARCODE, jsonObject.getString("barcode"));
				product.put(CATEGORY, jsonObject.getString("category"));
				product.put(UNITPRICE, jsonObject.getString("unitprice"));
				product.put(DISCOUNT, jsonObject.getString("discount"));
				product.put(NETPRICE, jsonObject.getString("netprice"));
				product.put(CATEGORYID, jsonObject.getString("categoryid"));
				product.put(VAT, jsonObject.getString("vat"));
				product.put(COST, jsonObject.getString("costprice"));
				products[i] = product;

			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return products;
	}

	public List<VtigerProducts> generateProducts(HashMap<String, String>[] products_hash) {
		List<VtigerProducts> products = new ArrayList<VtigerProducts>();
		
		for (int i = 0; i < products_hash.length; i++) {
			HashMap<String, String> object = products_hash[i];
			VtigerProducts product = new VtigerProducts();
			
			product.setProductname(object.get("productname"));
			product.setBarcode(object.get(BARCODE));
			product.setUnitPrice(object.get(UNITPRICE));
			product.setDiscount(object.get(DISCOUNT));
			product.setNetprice(object.get(NETPRICE));
			product.setVat(object.get(VAT));
			product.setCost(object.get(COST));
			product.setQtyinstock("0");

			// add to list
			products.add(i, product);

		}

		return products;
	}
	
	public void insertUpdateProducts(List<VtigerProducts> products) {
		HCrmEntityRepository crmrepo = new HCrmEntityRepository();

		for (int i = 0; i < products.size(); i++) {
			VtigerProducts product = products.get(i);
			if(isAlreadyExist(product)) {
				
				int productid= findProductId(product.getBarcode());
				product.setProductid(productid);
				System.out.println("Product id "+product.getProductid()+" already exist");
				updateProduct(product);
			}
			else {
				int productid = crmrepo.generateCrmId("VtigerProducts");
				insertNewProduct(product, productid);
				
			}
			
		}
	}
	
	private void updateProduct(VtigerProducts product) {
		String productno = "PRO"+product.getProductid();
		product.setProductNo(productno);
		boolean status = DBLocalHelper.updateRecord("VtigerProducts", product);
		System.out.println("Status: "+status);
		
	}

	private boolean isAlreadyExist(VtigerProducts product) {
		List records = DBLocalHelper.readRecord("VtigerProducts", BARCODE, product.getBarcode());
		if(records.size() > 0)  
			return true;
		else  	
		return false;
		
	}
	
	private int findProductId(String barcode) {
		List<VtigerProducts> records = DBLocalHelper.readRecord("VtigerProducts", BARCODE, barcode);
		if(records.size() > 0 ) {
		VtigerProducts product = (VtigerProducts) records.get(0);
		return product.getProductid();
		}
		
		return -1;
	}
	private void insertNewProduct(VtigerProducts product, int productid) {
		product.setProductid(productid);
		product.setProductNo("PRO"+productid);
		System.out.println("Product not exist. ID = "+productid);
		DBLocalHelper.saveRecord("VtigerProducts", product);
	}

}
