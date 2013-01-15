package com.java.sangrah.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

import org.apache.http.client.ClientProtocolException;
import org.hamcrest.core.IsNull;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.java.sangrah.models.VtigerProducts;
import com.java.sangrah.utils.DateUtils;

public class HProductsDownloadHandler {

	private final long SLEEP_TIME = 2 * 1000;
	private final String NEW_PRODUCT = "newproduct";
	private final String OLD_PRODUCT = "updatedproduct";
	private final String BASE_URL = "http://localhost/sangrahretail/download_data/DownloadData.php";

	private final String LICENSE_KEY = "?license=";
	private final String TYPE_KEY = "&type=";

	private String NEWPRODUCTS_URL = "";
	private String OLDPRODUCTS_URL = "";
	private JsonObject NEWPRODUCTS_JSON = null;
	private JsonObject OLDPRODUCTS_JSON = null;
    private int MAX_ATTEMPTS = 10;
    private int CURRENT_ATTEMPTS = 0;
	private JFrame frame;
	public HProductsDownloadHandler() {
		NEWPRODUCTS_URL = BASE_URL + LICENSE_KEY + "123456789" + TYPE_KEY + NEW_PRODUCT;
		OLDPRODUCTS_URL = BASE_URL + LICENSE_KEY + "123456789" + TYPE_KEY + OLD_PRODUCT;

	}

	public HProductsDownloadHandler(JFrame frame) {
		this.frame = frame;
		NEWPRODUCTS_URL = BASE_URL + LICENSE_KEY + "123456789" + TYPE_KEY + NEW_PRODUCT;
		OLDPRODUCTS_URL = BASE_URL + LICENSE_KEY + "123456789" + TYPE_KEY + OLD_PRODUCT;
	}

	public void loadProducts() {
		// check already products loaded or not
				boolean is_loaded = isAlreadyDownload();
				if (!is_loaded) {
					System.out.println("No data loaded for today");
					startDownloadThread();
				}
				
				
				
	}

	private void startDownloadThread() {
		new Thread(new Runnable() {

			@Override
			public void run() {
				while (true) {
					boolean download_status = downloadProducts();
					if (download_status)
						break;
					else {
						try {
							
							Thread.sleep(SLEEP_TIME);
							CURRENT_ATTEMPTS++;
							if(CURRENT_ATTEMPTS == MAX_ATTEMPTS) {
								JOptionPane.showMessageDialog(null, "Check settings unable to download products from server.");
								break;
							}
							
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				// when loading is finished, make frame disappear
				

			}
		}).start();
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

	
	private boolean downloadProducts() {
		boolean status = download();
		if (status) {
			System.out.println("Product download sucess");
			JsonArray NEWPRODUCTS_JSONARRAY = NEWPRODUCTS_JSON.getAsJsonArray("products");
			JsonArray OLDPRODUCTS_JSONARRAY = OLDPRODUCTS_JSON.getAsJsonArray("products");

			/* Add new products */
			if (NEWPRODUCTS_JSONARRAY.size() > 0) {
				storeProducts(NEWPRODUCTS_JSONARRAY);
			} else {
				System.out.println("No new products generated yet...");
				JOptionPane.showMessageDialog(null, "No new products generated yet...");
			}

			/* Update old products */
			if (OLDPRODUCTS_JSONARRAY.size() > 0) {
				storeProducts(OLDPRODUCTS_JSONARRAY);
			} else {
				System.out.println("No old products updated yet...");
				JOptionPane.showMessageDialog(null, "No old products updated yet...");
			}

		} else {
			System.err.println("Error while downloading products");
		}
		return status;
	}

	private boolean download() {
		boolean status = true;

		try {
			NEWPRODUCTS_JSON = new HttpRequestHandler().readHttpProducts(NEWPRODUCTS_URL);
			OLDPRODUCTS_JSON = new HttpRequestHandler().readHttpProducts(OLDPRODUCTS_URL);
			if (NEWPRODUCTS_JSON == null || OLDPRODUCTS_JSON == null) {
				System.out.println("NEWPRODUCTS_JSON: " + NEWPRODUCTS_JSON + " \n OLDPRODUCTS_JSON: " + OLDPRODUCTS_JSON);
				return false;
			}

		} catch (ClientProtocolException e) {
			status = false;
			e.printStackTrace();
		} catch (IOException e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

	private void storeProducts(JsonArray PRODUCTS_JSONARRAY) {
		ProductsParser parser = new ProductsParser();
		HashMap<String, String>[] readProductsList = parser.readProductsList(PRODUCTS_JSONARRAY);
		List<VtigerProducts> generateProducts = parser.generateProducts(readProductsList);
		parser.insertUpdateProducts(generateProducts);
	}

	public static void main(String[] args) {
		new HProductsDownloadHandler().loadProducts();
	}

}
