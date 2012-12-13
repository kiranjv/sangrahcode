package com.java.sangrah;

import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.java.sangrah.repos.LocalDbConfiguration;
import com.java.sangrah.repos.ServerDBConfiguration;
import com.java.sangrah.views.LoginPage;
import com.java.sangrah.views.SplashScreen;

/**
 * 
 * @author treewalker
 * 
 *         Application launching class handles all the initializations all the
 *         configuration like database.
 */
public class AplicationStarter {

	/**
	 * @param args
	 */

	private static Logger logger = Logger.getLogger(AplicationStarter.class);

	/**
	 * Default constructor loads database as background process in front side
	 * display loading screen.
	 */
	public AplicationStarter() {

		// Throw a nice little title page up on the screen first
		new SplashScreen(10000).showSplash();
		new Thread(new Runnable() {

			@Override
			public void run() {
				// Load local database connection
				LocalDbConfiguration.getConnection();
				logger.info("Local Database initialized.");

				// Initialize server database connection
				ServerDBConfiguration.getConnection();
				logger.info("Server database initialized. ");

				// Load login page to widgets
				SwingUtilities.invokeLater(new Runnable() {
					public void run() {
						logger.info("Starting login page");
						LoginPage inst = new LoginPage();
						inst.setLocationRelativeTo(null);
						inst.setVisible(true);

					}
				});
			}
		}).start();

	}

	public static void main(String[] args) {
		try {
			// Load logging configuration
			PropertyConfigurator.configure("log4j.properties");
			logger.setLevel(Level.INFO);
			UIManager
					.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
			new AplicationStarter();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedLookAndFeelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
