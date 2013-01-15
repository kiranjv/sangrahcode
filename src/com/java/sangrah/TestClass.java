package com.java.sangrah;

import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.http.client.ClientProtocolException;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.java.sangrah.controllers.DBLocalHelper;
import com.java.sangrah.controllers.HttpRequestHandler;
import com.java.sangrah.controllers.ProductsParser;
import com.java.sangrah.models.VtigerCrmentity;
import com.java.sangrah.models.VtigerProducts;
import com.java.sangrah.models.VtigerRoyality;
import com.java.sangrah.utils.DateUtils;

public class TestClass {

	private static Session session;
	static SessionFactory sessionFactory1 = new Configuration().configure("mysqlhibernate.cfg.xml").buildSessionFactory();

	public static void main(String[] args) {
		String url = "http://localhost/sangrahretail/download_data/DownloadData.php?license=123456789&type=";
		url = url + "newproduct";
		 JsonObject json = null;
		try {
			json = new HttpRequestHandler().readHttpProducts(url);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ProductsParser parser = new ProductsParser();
		JsonArray readJsonArray = parser.getJsonArray(json, "products");
		HashMap<String, String>[] readProductsList = parser.readProductsList(readJsonArray);
		List<VtigerProducts> generateProducts = parser.generateProducts(readProductsList);
		parser.insertUpdateProducts(generateProducts);
		
		
		
		
		
		
		
		
		
		
		
		/*
		 * VtigerContactroyality maxroyalt = (VtigerContactroyality)
		 * DBLocalHelper.getMax(VtigerContactroyality.class, "id"); //
		 * System.out.println("max royal:"+maxroyalt.toString()); int royalityid = 0; if (maxroyalt
		 * != null) royalityid = maxroyalt.getRoyalityid() + 1; VtigerContactroyality royalty = new
		 * VtigerContactroyality(royalityid, 69, "6969", 1000); //
		 * royalty.setRoyalityid(maxroyalt.getRoyalityid() + 1); // royalty.setRoyalityid(1);
		 * //System.out.println("max:" + royalty.toString());
		 * DBLocalHelper.saveRecord(VtigerContactroyality.class.getSimpleName(), royalty);
		 */
		/*
		 * VtigerRoyalityAmount maxroyalt = (VtigerRoyalityAmount)
		 * DBLocalHelper.getMax(VtigerRoyalityAmount.class, "id"); VtigerRoyalityAmount royalty =
		 * new VtigerRoyalityAmount(); royalty.setId(maxroyalt.getId()+1);
		 * royalty.setRoyalityCount(1); royalty.setRoyalityamount("500"); royalty.setFromDate("");
		 * royalty.setToDate("");
		 * DBLocalHelper.saveRecord(VtigerRoyalityAmount.class.getSimpleName(), royalty);
		 */

		// String date = DateUtils.toSqlDate(System.currentTimeMillis());
		// System.out.println(date);
		// String model = VtigerRoyality.class.getSimpleName();
		// VtigerRoyality mroyalt = (VtigerRoyality) DBLocalHelper.getMax(VtigerRoyality.class,
		// "royalityid");
		// VtigerRoyality royalt = new VtigerRoyality(mroyalt.getRoyalityid()+1, 2, "0.5", new
		// Date(System.currentTimeMillis()) , new Date(System.currentTimeMillis()), (short)0);
		// System.out.println(royalt.toString());
		// DBLocalHelper.saveRecord(model, royalt);
		// System.out.println("max: "+mroyalt.toString());

		// long time = System.currentTimeMillis();
		// System.out.println(DateUtils.getDateTime(time));

		// String productid = "18";
		// String hsql = "From "
		// + VtigerInventorytransaction.class.getSimpleName()
		// + " WHERE productid="+18;
		//
		// List<VtigerInventorytransaction> transactions = DBLocalHelper.executeHQuery(hsql);
		// int transactionIds[] = new int[transactions.size()];
		// int i = 0;
		// for (Iterator iterator = transactions.iterator(); iterator.hasNext();) {
		// VtigerInventorytransaction vtigerInventorytransaction = (VtigerInventorytransaction)
		// iterator
		// .next();
		// transactionIds[i++] = vtigerInventorytransaction.getTransactionId();
		// System.out.println(vtigerInventorytransaction.getTransactionId());
		//
		// }
		// System.out.println();
		// VtigerInventorytransaction mx = transactions.get(transactions.size() -1);
		// System.out.println(mx.getTransactionId());

		// VtigerInvoice invoice = (VtigerInvoice) DBLocalHelper.getMax(
		// VtigerInvoice.class, "invoiceid");
		// System.out.println("max val: " + invoice.getInvoiceid());
		//
		//
		// int max_val = DBLocalHelper.getMaxValue(
		// VtigerInvoice.class, "invoiceid");
		// System.out.println("max val: " + max_val);

		// System.out.println("model name: "
		// + VtigerProducts.class.getSimpleName());
		//
		// System.out.println("Row couont: "
		// + DBLocalHelper.getRowCount(VtigerProducts.class
		// .getSimpleName()));
		// Server database querys

		// VtigerProducts product1 = new VtigerProducts(156, "pro121",
		// "computer1", 20, 1);
		// VtigerProducts product2 = new VtigerProducts(202, "pro122",
		// "computer1", 20, 1);
		// VtigerProducts product3 = new VtigerProducts(203, "pro123",
		// "computer1", 20, 1);
		// VtigerProducts product4 = new VtigerProducts(204, "pro124",
		// "computer1", 20, 1);
		// VtigerProducts product5 = new VtigerProducts(205, "pro125",
		// "computer1", 20, 1);
		// List<VtigerProducts> list = new ArrayList<VtigerProducts>();
		// list.add(product1);
		// list.add(product2);
		// list.add(product3);
		// list.add(product4);
		// list.add(product5);
		// boolean status =
		// DBServerHelper.saveRecord(VtigerProducts.class.getSimpleName(),
		// product1);
		// System.out.println("status: "+status);
		//
		//
		// VtigerProducts product = new VtigerProducts(156, "pro121updated",
		// "computer1updated", 20, 1);
		// boolean status =
		// DBServerHelper.deleteRecord(VtigerProducts.class.getSimpleName(),
		// product);
		// System.out.println("is deleted: "+ status);

		// VtigerProducts product = new VtigerProducts(156, "pro121updated",
		// "computer1updated", 20, 1);
		// boolean status =
		// DBServerHelper.updateRecord(VtigerProducts.class.getSimpleName(),
		// product);
		// System.out.println("is updated: "+ status);

		// System.out
		// .println("-----------------------------------------------------");
		// List<VtigerProducts> enys = DBServerHelper.readRecords(
		// VtigerProducts.class.getSimpleName(), "productid", 15);
		// System.out.println("Number of records:" + enys.size());
		// for (Iterator iterator = enys.iterator(); iterator.hasNext();) {
		// VtigerProducts crmentity = (VtigerProducts) iterator.next();
		// System.out.println(crmentity.getProductid() + " "
		// + crmentity.getProductname() + " " + crmentity.getCost());
		// }

		// Client database querys

		// VtigerProducts product = new VtigerProducts(201, "pro121updated",
		// "computer1updated", 20, 1);
		// boolean status =
		// DBLocalHelper.deleteRecord(VtigerProducts.class.getSimpleName(),
		// product);
		// System.out.println("is deleted: "+ status);

		// VtigerProducts product = new VtigerProducts(201, "pro121updated",
		// "computer1updated", 20, 1);
		// boolean status =
		// DBLocalHelper.updateRecord(VtigerProducts.class.getSimpleName(),
		// product);
		// System.out.println("is updated: "+ status);

		// VtigerProducts product1 = new VtigerProducts(201, "pro121",
		// "computer1", 20, 1);
		// VtigerProducts product2 = new VtigerProducts(202, "pro122",
		// "computer1", 20, 1);
		// VtigerProducts product3 = new VtigerProducts(203, "pro123",
		// "computer1", 20, 1);
		// VtigerProducts product4 = new VtigerProducts(204, "pro124",
		// "computer1", 20, 1);
		// VtigerProducts product5 = new VtigerProducts(205, "pro125",
		// "computer1", 20, 1);
		// List<VtigerProducts> list = new ArrayList<VtigerProducts>();
		// list.add(product1);
		// list.add(product2);
		// list.add(product3);
		// list.add(product4);
		// list.add(product5);
		// boolean status =
		// DBLocalHelper.saveRecords(VtigerProducts.class.getSimpleName(),
		// list);
		// System.out.println("status: "+status);

		// System.out.println("Number of records:" + entitys.size());
		// for (Iterator iterator = entitys.iterator(); iterator.hasNext();) {
		// VtigerProducts crmentity = (VtigerProducts) iterator.next();
		// System.out.println(crmentity.getProductid() + " "
		// + crmentity.getProductname() + " " + crmentity.getCost());
		// }
		// System.out
		// .println("-----------------------------------------------------");
		// List<VtigerProducts> enys = DBLocalHelper.readRecord(
		// VtigerProducts.class.getSimpleName(), "productid", 120);
		// System.out.println("Number of records:" + enys.size());
		// for (Iterator iterator = enys.iterator(); iterator.hasNext();) {
		// VtigerProducts crmentity = (VtigerProducts) iterator.next();
		// System.out.println(crmentity.getProductid() + " "
		// + crmentity.getProductname() + " " + crmentity.getCost());
		// }

		// readTableData();
		// readTableData("25");
		//
		// HCrmEntityRepository crmrepo = new HCrmEntityRepository();
		// crmrepo.readServerEntitys();
		// System.out.println("-------- Server From 25 - 50 -----------------");
		// crmrepo.readServerEntitys(25, 50);
		// System.out.println("-------- Server From 25  -----------------");
		// crmrepo.readServerEntitys(25);
		// System.out.println();
		// System.out.println("-------- Local From all -----------------");
		// crmrepo.readLocalEntitys();
		// System.out.println("-------- Local From 25 - 50 -----------------");
		// crmrepo.readLocalEntitys(25, 50);
		// System.out.println("-------- Local From 25  -----------------");
		// crmrepo.readLocalEntitys(25);
	}

	public static void readTableData() {
		session = sessionFactory1.openSession();
		Transaction transaction = session.beginTransaction();
		transaction.begin();
		Criteria crit = session.createCriteria(VtigerProducts.class);
		ArrayList<VtigerProducts> empList = (ArrayList) crit.list();
		System.out.println("Records from Mysql Database products details");
		for (VtigerProducts productentity : empList) {
			System.out.println(productentity.getBarcode() + " " + productentity.getProductid() + " " + productentity.getCost());

		}

		// vtigercrm entitys
		crit = session.createCriteria(VtigerCrmentity.class);
		ArrayList<VtigerCrmentity> crmList = (ArrayList) crit.list();
		System.out.println("Records from Mysql Database products details");
		for (VtigerCrmentity crmentity : crmList) {
			System.out.println(crmentity.getCrmid() + " " + crmentity.getCreatedtime() + " " + crmentity.getDescription());

		}
		session.close();
	}

	private static void readTableData(String index) {

		session = sessionFactory1.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			List entitys = session.createQuery("FROM VtigerCrmentity where crmid > " + index + " and crmid <" + "100").list();
			for (Iterator iterator = entitys.iterator(); iterator.hasNext();) {
				VtigerCrmentity crmentity = (VtigerCrmentity) iterator.next();
				System.out.println(crmentity.getCrmid() + " " + crmentity.getCreatedtime() + " " + crmentity.getDescription());
			}
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

}
