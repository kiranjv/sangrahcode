package com.java.sangrah.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import com.java.sangrah.models.VtigerCrmentity;
import com.java.sangrah.models.VtigerCrmentitySeq;
import com.java.sangrah.models.VtigerInventoryproductrel;
import com.java.sangrah.models.VtigerInventorytransaction;
import com.java.sangrah.models.VtigerModentityNumSeq;
import com.java.sangrah.models.VtigerModentitynum;
import com.java.sangrah.models.VtigerProductcf;
import com.java.sangrah.models.VtigerProducts;
import com.java.sangrah.models.VtigerWarehouseStock;
import com.java.sangrah.models.VtigerWarehousestoreInventorytransaction;
import com.java.sangrah.repos.LocalDbConfiguration;
import com.java.sangrah.repos.ServerDBConfiguration;
import com.java.sangrah.utils.DateUtils;
import com.java.sangrah.utils.Util;

public class ProductsDownloadController {

	private Connection local_connection;
	private Connection server_connection;

	public ProductsDownloadController() {
		local_connection = LocalDbConfiguration.getConnection();
		server_connection = ServerDBConfiguration.getConnection();
	}

	public void productsDownload() {

		// check already products loaded or not
		boolean is_loaded = isAlreadyDownload();
		if (!is_loaded) {
			System.out.println("No data loaded for today");
			loadData();
		}

	}

	private boolean isAlreadyDownload() {
		boolean isdownloaded = false;
		Properties props = new Properties();
		File config_file = new File("AppConfig.properties");
		try {
			if (!config_file.exists()) {

				String current_date = DateUtils.getDate(System.currentTimeMillis());
				props.setProperty("downloaddate", current_date);
				System.out.println("downloaddate: " + current_date);

				System.out.println("Creating new App Configuration propertues");
				config_file.createNewFile();
				props.store(new FileOutputStream(config_file), null);
				isdownloaded = false;

			} else {
				System.out.println("App Configuration already exist");
				props.load(new FileInputStream("AppConfig.properties"));
				String downloaddate = props.getProperty("downloaddate");
				String current_date = DateUtils.getDate(System.currentTimeMillis());
				System.out.println("Current date: " + current_date + " downloaddate: "
							+ downloaddate);
				if (current_date.equalsIgnoreCase(downloaddate)) {
					System.out.println("Already products downloaded");
					isdownloaded = true;
				} else {
					System.out.println("Need to download products");
					props.setProperty("downloaddate", current_date);
					System.out.println("Setting config date: " + current_date);
					config_file.createNewFile();
					props.store(new FileOutputStream(config_file), null);
					isdownloaded = false;
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isdownloaded;

	}

	private void loadData() {

		// Load vtiger_crmentity vtiger_crmentityseq

		System.out.println("=======================Loading crmentity data=========================================");
		loadCrmEntityData();
		System.out.println("======================================================================================");
		System.out.println("=======================Loading products data==========================================");
		loadProductsData();
		System.out.println("======================================================================================");

		System.out.println("=======================Loading inventory data=========================================");
		loadInventoryData();
		System.out.println("======================================================================================");

		// vtiger_warehouse_stock = ;
		System.out.println("=======================Loading warehouse data=========================================");
		loadWarehouseData();
		System.out.println("=====================================================================================");

		// vtiger_modentity_num = ;
		// vtiger_modentity_num_seq
		System.out.println("======================Loading mod entity data=========================================");
		loadModEntiyNumData();
		System.out.println("======================================================================================");

		// VtigerInventorytransaction 
		// VtigerWarehousestoreInventorytransaction
		System.out.println("======================Loading transaction data=========================================");
		loadTransactionData();
		System.out.println("======================================================================================");
		
		
	}

	private void loadTransactionData() {
		// VtigerInventorytransaction
		String modelname = "";
		try {
			System.out.println("Downloading VtigerInventorytransaction data");
			modelname = VtigerInventorytransaction.class.getSimpleName();
			int count_transaction = DBLocalHelper.getRowCount(modelname);
			System.out.println(count_transaction + " " + modelname + " local records exist.");
			List<VtigerInventorytransaction> inventorytransaction = DBServerHelper.readRecords(modelname,
						"transaction_id", (count_transaction + 1));
			System.out.println(inventorytransaction.size() + " " + modelname
						+ " records received from server.");
			boolean status = DBLocalHelper.saveRecords(modelname, inventorytransaction);
			System.out.println("Local database save status: " + status);
			System.out.println("Downloading VtigerInventorytransaction data completed");

		} catch (Exception e) {
			System.err.println("Error inventorytransaction loading");
			e.printStackTrace();
		}
		
		
				// VtigerWarehousestoreInventorytransaction
		try {
			System.out.println("Downloading VtigerWarehousestoreInventorytransaction data");
			modelname = VtigerWarehousestoreInventorytransaction.class.getSimpleName();
			int count_transaction = DBLocalHelper.getRowCount(modelname);
			System.out.println(count_transaction + " " + modelname + " local records exist.");
			List<VtigerWarehousestoreInventorytransaction> warehousetransaction = DBServerHelper.readRecords(modelname,
						"warehousestore_transaction_id", (count_transaction + 1));
			System.out.println(warehousetransaction.size() + " " + modelname
						+ " records received from server.");
			boolean status = DBLocalHelper.saveRecords(modelname, warehousetransaction);
			System.out.println("Local database save status: " + status);
			System.out.println("Downloading VtigerWarehousestoreInventorytransaction data completed");

		} catch (Exception e) {
			System.err.println("Error VtigerWarehousestoreInventorytransaction loading");
			e.printStackTrace();
		}
		
	}

	private void loadModEntiyNumData() {
		try {
			// vtiger_modentity_num = ;
			System.out.println("Downloading vtiger_modentity_num data");
			String modelname = VtigerModentitynum.class.getSimpleName();
			List<VtigerModentitynum> VtigerModentitynum_records = DBServerHelper
						.readRecords(modelname);
			System.out.println(VtigerModentitynum_records.size() + " " + modelname
						+ " records received from server.");
			
			DBLocalHelper.deleteRecords(modelname);
			DBLocalHelper.saveRecords(modelname, VtigerModentitynum_records);
			System.out.println("Downloading vtiger_modentity_num data completed");
		} catch (Exception e) {
			System.err.println("Error in VtigerModentitynum loadding");
			e.printStackTrace();
		}

		try {
			// vtiger_modentity_num_seq = ;
			System.out.println("Downloading vtiger_modentity_num_seq data");
			String modelname = VtigerModentityNumSeq.class.getSimpleName();
			List<VtigerModentityNumSeq> VtigerModentityNumSeq_records = DBServerHelper
						.readRecords(modelname);
			System.out.println(VtigerModentityNumSeq_records.size() + " " + modelname
						+ " records received from server.");

			DBLocalHelper.deleteRecords(modelname);
			DBLocalHelper.saveRecords(modelname, VtigerModentityNumSeq_records);
			System.out.println("Downloading vtiger_modentity_num_seq data completed");
		} catch (Exception e) {
			System.err.println("Error in VtigerModentityNumSeq loadding");
			e.printStackTrace();
		}
	}

	private void loadWarehouseData() {
		try {
			// vtiger_warehouse_stock = ;
			System.out.println("Downloading vtiger_warehouse_stock data");
			String modelname = VtigerWarehouseStock.class.getSimpleName();
			List<VtigerWarehouseStock> VtigerWarehouseStock_records = DBServerHelper
						.readRecords(modelname);
			System.out.println(VtigerWarehouseStock_records.size() + " " + modelname
						+ " records received from server.");
			DBLocalHelper.deleteRecords(modelname);
			DBLocalHelper.saveRecords(modelname, VtigerWarehouseStock_records);
			System.out.println("Downloading vtiger_warehouse_stock data completed");
		} catch (Exception e) {
			System.err.println("Error in VtigerWarehouseStock loadding");
			e.printStackTrace();
		}
		
	}

	private void loadInventoryData() {
		// vtiger_inventorytransaction = ;
		String modelname = "";
		try {
			// vtiger_crmentity
			System.out.println("Downloading vtiger_inventorytransaction data");
			modelname = VtigerInventorytransaction.class.getSimpleName();
			int count_Inventorytransaction = DBLocalHelper.getRowCount(modelname);
			System.out.println(count_Inventorytransaction + " " + modelname
						+ " local records exist.");
			List<VtigerInventorytransaction> inventrytransaction_records = DBServerHelper
						.readRecords(modelname, "transaction_id", (count_Inventorytransaction + 1));
			System.out.println(inventrytransaction_records.size() + " " + modelname
						+ " records received from server.");

			boolean status = DBLocalHelper.saveRecords(modelname, inventrytransaction_records);
			System.out.println("Local database save status: " + status);
			System.out.println("Downloading vtiger_inventorytransaction data completed");

		} catch (Exception e) {
			System.err.println("Error VtigerInventorytransaction loadding");
			e.printStackTrace();
		}

		// vtiger_inventoryproductrel ;
		try {
			System.out.println("Downloading vtiger_inventoryproductrel data");
			modelname = VtigerInventoryproductrel.class.getSimpleName();
			int count_inventoryproductrel = DBLocalHelper.getRowCount(modelname);
			System.out.println(count_inventoryproductrel + " " + modelname
						+ " local records exist.");
			List<VtigerInventoryproductrel> VtigerInventoryproductrel_records = DBServerHelper
						.readRecords(modelname);
			System.out.println(VtigerInventoryproductrel_records.size() + " " + modelname
						+ " records received from server.");
			DBLocalHelper.deleteRecords(modelname);
			DBLocalHelper.saveRecords(modelname, VtigerInventoryproductrel_records);
			System.out.println("Downloading vtiger_inventoryproductrel data completed");
		} catch (Exception e) {
			System.err.println("Error in VtigerInventoryproductrel");
			e.printStackTrace();
		}

	}

	private void loadCrmEntityData() {
		String modelname = "";
		try {
			// vtiger_crmentity
			System.out.println("Downloading crmentity data");
			modelname = VtigerCrmentity.class.getSimpleName();
			int count_crmentity = DBLocalHelper.getRowCount(modelname);
			System.out.println(count_crmentity + " " + modelname + " local records exist.");
			List<VtigerCrmentity> crmentity_records = DBServerHelper.readRecords(modelname,
						"crmid", (count_crmentity + 1));
			System.out.println(crmentity_records.size() + " " + modelname
						+ " records received from server.");
			for (Iterator iterator = crmentity_records.iterator(); iterator.hasNext();) {
				VtigerCrmentity vtigerCrmentity = (VtigerCrmentity) iterator.next();
				System.out.println("downloaded crm id: "+vtigerCrmentity.getCrmid());
			}
			boolean status = DBLocalHelper.saveRecords(modelname, crmentity_records);
			System.out.println("Local database save status: " + status);
			System.out.println("Downloading crmentity data completed");

		} catch (Exception e) {
			System.err.println("Error crmentity loading");
			e.printStackTrace();
		}

		try {
			// vtiger_crmentityseq = ;
			System.out.println("Downloading crmentityseq data");
			modelname = VtigerCrmentitySeq.class.getSimpleName();
			List<VtigerCrmentitySeq> crmentityseq_records = DBServerHelper.readRecords(modelname);
			System.out.println(crmentityseq_records.size() + " " + modelname
						+ " records received from server.");
			DBLocalHelper.deleteRecords(modelname);
			DBLocalHelper.saveRecords(modelname, crmentityseq_records);
			System.out.println("Downloading crmentityseq data completed");
		} catch (Exception e) {
			System.err.println("Error in VtigerCrmentitySeq loadding");
			e.printStackTrace();
		}
	}

	private void loadProductsData() {
		// vtiger_products = ;
		// vtiger_productcf = ;

		String modelname = "";
		try {
			System.out.println("Downloading vtiger_products data");
			modelname = VtigerProducts.class.getSimpleName();
			List<VtigerProducts> products_records = DBServerHelper.readRecords(modelname);
			System.out.println(products_records.size() + " " + modelname
						+ " records received from server.");
			System.out.println("Deleting local records");
			DBLocalHelper.deleteRecords(modelname);
			boolean status = DBLocalHelper.saveRecords(modelname, products_records);
			System.out.println("Local database save status: " + status);
			System.out.println("Downloading vtiger_products data completed");

		} catch (Exception e) {
			System.err.println("Error crmentity loading");
			e.printStackTrace();
		}

		// vtiger_crmentityseq = ;
		try {
			// vtiger_crmentity
			System.out.println("Downloading vtiger_productscf data");
			modelname = VtigerProductcf.class.getSimpleName();
			List<VtigerProductcf> productcf_records = DBServerHelper.readRecords(modelname);
			System.out.println(productcf_records.size() + " " + modelname
						+ " records received from server.");
			System.out.println("------------------------------------");

			System.out.println("Deleting local recards");
			DBLocalHelper.deleteRecords(modelname);
			boolean status = DBLocalHelper.saveRecords(modelname, productcf_records);
			System.out.println("Local database save status: " + status);
			System.out.println("Downloading vtiger_productscf data completed");

		} catch (Exception e) {
			System.err.println("Error crmentity loading");
			e.printStackTrace();
		}

	}

	/**
	 * 
	 * @param serversql
	 *            - Query to execute in server database.
	 * @return result of the query execution in database.
	 */
	private ResultSet sendServerRequest(String serversql) {
		ResultSet result = null;
		try {
			Statement stmt = server_connection.createStatement();
			result = stmt.executeQuery(serversql);

		} catch (SQLException e) {
			System.err.println("Exception to read count");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * Calculate number of rows in the local database table using sql count.
	 * function.
	 * 
	 * @param tablename
	 *            - Name of the table
	 * @return number of rows in the local database table.
	 */
	public int getLocalRowCount(String tablename) {
		int num_rows = 0;
		String sql = "SELECT COUNT(*) FROM " + tablename;
		try {
			Statement stmt = local_connection.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			num_rows = result.getInt(1);
		} catch (SQLException e) {
			System.err.println("Exception to read count");
			e.printStackTrace();
		}
		return num_rows;

	}

	private String[][] convert_toArray(ResultSet result) {
		int num_cols = Util.numOfCols(result);
		int num_rows = Util.numOfRows(result);
		System.out.println("Number of col's :" + num_cols + " Num of rows: " + num_rows);
		String resultset_array[][] = new String[num_rows][num_cols];
		try {

			int rowindex = 0;
			result.first();
			while (result.next()) {
				String rowdata[] = new String[num_cols];
				for (int i = 0; i < num_cols; i++) {
					rowdata[i] = result.getString(i + 1);
				}
				resultset_array[rowindex] = rowdata;
				rowindex++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return resultset_array;
	}

}
