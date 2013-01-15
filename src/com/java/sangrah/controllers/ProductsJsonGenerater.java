package com.java.sangrah.controllers;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.Type;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.java.sangrah.models.VtigerInventoryproductrel;
import com.java.sangrah.models.VtigerInvoice;
import com.java.sangrah.models.VtigerProducts;
import com.java.sangrah.utils.DateUtils;

public class ProductsJsonGenerater {

	public List<VtigerInvoice> getDayInvoices(String date) {

		String HSQL = "From VtigerInvoice WHERE invoicedate = '" + date + "'";
		List<VtigerInvoice> invoices_list = DBLocalHelper.executeHQuery(HSQL);
		return invoices_list;
	}

	public List<VtigerInventoryproductrel> getInvoiceProducts(int invoiceid) {
		System.out.println("Productrel id: " + invoiceid);
		List<VtigerInventoryproductrel> invoicesproductrel_list = new ArrayList<VtigerInventoryproductrel>();

		List<VtigerInventoryproductrel> invoicesproduct_list = DBLocalHelper.readRecords("VtigerInventoryproductrel");// ,
																														// "id",
																														// invoiceid);

		for (int i = 0; i < invoicesproduct_list.size(); i++) {
			VtigerInventoryproductrel invoice = invoicesproduct_list.get(i);
			if (invoice.getId() == invoiceid) {
				invoicesproductrel_list.add(invoice);

			}
		}
		return invoicesproductrel_list;
	}

	public JsonObject convertToJson(VtigerInvoice invoice) {

		JsonObject json = new JsonObject();
		json.addProperty("invoiceid", invoice.getInvoiceid());
		json.addProperty("invoiceno", invoice.getInvoiceNo());
		json.addProperty("invoicedate", invoice.getInvoicedate());
		json.addProperty("subtotal", invoice.getSubtotal());
		json.addProperty("grandtotal", invoice.getTotal());
		json.addProperty("cash", invoice.getCash());
		json.addProperty("card", invoice.getCard());
		json.addProperty("storeid", invoice.getStoreid());
		return json;
	}

	public JsonObject convertToJson(VtigerInventoryproductrel invwntoryproduct_rel) {
		int productid = invwntoryproduct_rel.getProductid();
		VtigerProducts product = readProduct(productid);
		JsonObject json = new JsonObject();
		json.addProperty("productid", productid);
		json.addProperty("barcode", product.getBarcode());// read from product table
		json.addProperty("quantity", invwntoryproduct_rel.getQuantity());
		json.addProperty("cost_price", product.getCost());// read from product table
		json.addProperty("discount_amount", invwntoryproduct_rel.getDiscountAmount());
		json.addProperty("vat", invwntoryproduct_rel.getVat());
		json.addProperty("tax_amount", invwntoryproduct_rel.getTaxamount());
		json.addProperty("sellingprice", invwntoryproduct_rel.getListprice());
		json.addProperty("netprice", invwntoryproduct_rel.getNetprice());

		return json;
	}

	private VtigerProducts readProduct(int productid) {
		VtigerProducts product = (VtigerProducts) DBLocalHelper.readRecord("VtigerProducts", "productid", productid).get(0);
		return product;

	}

	public JsonObject prepareInvoiceJson(String date) {
		// main json object
		JsonObject OutterJsonObject = new JsonObject();
		JsonObject jsoninvoices = new JsonObject();
		JsonArray productupload_jsonarray = new JsonArray();
		JsonArray invoices_jsonarray = new JsonArray();
		
		
		
		
		List<VtigerInvoice> invoices = getDayInvoices(date);
		for (int i = 0; i < invoices.size(); i++) {
			VtigerInvoice invoice = invoices.get(i);
			JsonObject invoiceJson = convertToJson(invoice);
			
			// Add each invoice to invoices_jsonarray
			invoices_jsonarray.add(invoiceJson);
			//System.out.println(invoiceJson.toString());
			//System.out.println("----------inventroyproductrel-------------------");
			/*Add each invoice product to invoiceproducts_jsonarray*/
			JsonArray invoiceproducts_jsonarray = new JsonArray();
			List<VtigerInventoryproductrel> invoiceProducts = getInvoiceProducts(invoice.getInvoiceid());
			for (int j = 0; j < invoiceProducts.size(); j++) {
				VtigerInventoryproductrel vtigerInventoryproductrel = invoiceProducts.get(j);
				JsonObject productJson = convertToJson(vtigerInventoryproductrel);
				invoiceproducts_jsonarray.add(productJson);
				//System.out.println("Product "+ j +" json: "+productJson.toString());
			}
           //System.out.println("--------------------------------------------------");
           /* Add products array to invoice json. */
           invoiceJson.add("products", invoiceproducts_jsonarray);
           /* Add each invoice to invoices_jsonarray. */
           invoices_jsonarray.add(invoiceJson);
		}
		
		jsoninvoices.add("invoices", invoices_jsonarray);
		productupload_jsonarray.add(jsoninvoices);
		OutterJsonObject.add("productupload", productupload_jsonarray);
		
		return OutterJsonObject;
	}

	public static void main(String[] args) {
		ProductsJsonGenerater productsJsonGenerater = new ProductsJsonGenerater();
		String date = DateUtils.getDate(System.currentTimeMillis());
		JsonObject finalJson = productsJsonGenerater.prepareInvoiceJson(date);
		System.out.println("Final Json object...");
		System.out.println(finalJson.toString());

		/*
		 * List<VtigerInvoice> dayInvoices =
		 * productsJsonGenerater.getDayInvoices(DateUtils.getDate(System.currentTimeMillis()));
		 * System.out.println("day invoices: " + dayInvoices.size()); for (int i = 0; i <
		 * dayInvoices.size(); i++) { List<VtigerInventoryproductrel> invoiceProductsRel =
		 * productsJsonGenerater.getInvoiceProducts(dayInvoices.get(i).getInvoiceid());
		 * System.out.println("invoice products: " + invoiceProductsRel.size()); for (int j = 0; j <
		 * invoiceProductsRel.size(); j++) {
		 * System.out.println(invoiceProductsRel.get(j).toString()); } }
		 */

	}

}
