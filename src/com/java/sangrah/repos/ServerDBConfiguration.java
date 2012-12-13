package com.java.sangrah.repos;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ServerDBConfiguration {

	private static Connection connection = null;
	private static Logger logger = Logger
			.getLogger(ServerDBConfiguration.class);
	private static SessionFactory session_factory = null;

	private ServerDBConfiguration() {
		logger.info("Creating server database connection");
		connection = createDBConnection();
		logger.info("Server database connection completed");

	}

	public static Connection getConnection() {
		if (connection == null) {
			new ServerDBConfiguration();
		}
		return connection;
	}

	public static SessionFactory  getServerDBSessionFactory()
	{
		if(session_factory  == null) {
			session_factory = new  Configuration().configure("mysqlhibernate.cfg.xml").buildSessionFactory();
		}
		return session_factory ;
	}
	
	private Connection createDBConnection() {
		String jdbcDriver;
		String connectionURLThin;
		String DbName;
		String DbUserId;
		String DbUserpassword;
		String DbUrl;
		String DbPath;

		Properties props = new Properties();

		try {

			logger.info("Reading properties..");
			props.load(new FileInputStream("ServerDBConfiguration.properties"));

			// mysql driver class
			jdbcDriver = props.getProperty("jdbcDriver");
			logger.info("Server DataBase Driver: " + jdbcDriver);
			System.out.println("Server DataBase Driver: " + jdbcDriver);
			// server database url address
			DbUrl = props.getProperty("jdbcURLConnection");
			logger.info("Server Database URL:" + DbUrl);
			System.out.println("Server Database URL:" + DbUrl);

			// server database userid
			DbUserId = props.getProperty("DbUserId");
			logger.info("Server UserID: " + DbUserId);
			System.out.println("Server UserID: " + DbUserId);

			// server database password
			DbUserpassword = props.getProperty("DbUserpassword");
			logger.info("Server Password: " + DbUserpassword);
			System.out.println("Server Password: " + DbUserpassword);

			Class.forName(jdbcDriver);
			connection = DriverManager.getConnection(DbUrl, DbUserId,
					DbUserpassword);
		} catch (Exception e) {
			System.err.println("Exception while creating connection");
			logger.error("Exception while creating connection");
			e.printStackTrace();
		} finally {
			return connection;
		}

	}

	public static void main(String[] args)
			throws java.lang.InterruptedException {

		ServerDBConfiguration dbc = new ServerDBConfiguration();
		dbc.getConnection();
	}

}
