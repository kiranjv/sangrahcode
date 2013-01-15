package com.java.sangrah.controllers;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.swing.JOptionPane;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;

public class HttpRequestHandler {
	
	private JsonObject json = null;
	public JsonObject readHttpProducts(String url) throws ClientProtocolException, IOException {
		 
		System.out.println("URL: " + url);
		HttpClient client = new DefaultHttpClient();
		HttpPost post = new HttpPost(url);

		HttpResponse response = client.execute(post);
		StatusLine statusLine = response.getStatusLine();
		//System.out.println("Response: " + response);
		System.out.println("Status code:" + statusLine.getStatusCode());
		if (statusLine.getStatusCode() == 200) {
			HttpEntity entity1 = response.getEntity();
			// do something useful with the response body
			// and ensure it is fully consumed
			if (entity1.isStreaming()) {
				InputStream input_stream = entity1.getContent();
				DataInputStream datainput = new DataInputStream(input_stream);
				String jsondata = datainput.readLine();
				boolean status = isJson(jsondata);
				if (status) {
					JsonParser parser = new JsonParser();
					JsonElement parse = parser.parse(jsondata);
					json = parse.getAsJsonObject();
					System.out.println(json.toString());
				}
			}

			EntityUtils.consume(entity1);
		} else {
			System.err.println("Connection failure status code " + statusLine.getStatusCode());
		}

		return json;

	}

	private boolean isJson(String jsondata) {

		if (jsondata.startsWith("{")) {
			System.out.println("Response is in json format");
			return true;
		} else if (jsondata.contains("Type not found")) {
			JOptionPane.showMessageDialog(null, "Type not found...");
			return false;
		}
		else {
			System.out.println("Response is not json format");
			System.out.println(jsondata);
			makeEmptyJSon();
			return false;
		}

	}

	private JsonObject makeEmptyJSon() {
		json = new JsonObject();
		json.add("products", new JsonArray());
		return json;

	}
}
