package com.java.sangrah.controllers;

import java.awt.BorderLayout;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.SwingUtilities;

import com.java.sangrah.models.User;
import com.java.sangrah.models.VtigerUsers;
import com.java.sangrah.repos.HUserRepo;
import com.java.sangrah.repos.UserRepository;
import com.java.sangrah.utils.PasswordEncryptHelper;


public class LoginController {

	/**
	 * @param args
	 */

	public boolean doLogin(String username, String password) {

		// Retrieve encrypted password from Users table
		HUserRepo userrepo = new HUserRepo();
		VtigerUsers user = userrepo.getUserDetails(username);
		// convert the Password to encrypted password
		String encrypted_pass = new PasswordEncryptHelper().encrypt_password(
				username, password, user.getCryptType());
		System.out.println("Returned encrypted password: " + encrypted_pass);
		if (encrypted_pass != null) {
			String server_encrypted_password = "$1$ad$hsl2KFybNRnbXBa.b.WWv.";// user.getEncrypted_password();
			if (encrypted_pass.equalsIgnoreCase(server_encrypted_password)) {
				return true;
			}
		} else {
			System.err.println("encrypted password is null");
		}
		return false;
	}

	public void doBackGroundProcess() {
		final JFrame frame = new JFrame("Loading...");
		final JProgressBar progressBar = new JProgressBar();
		FocusListener foucslisner = new FocusListener() {
			@Override
			public void focusGained(FocusEvent fe) {
			}

			@Override
			public void focusLost(FocusEvent fe) {
				frame.setFocusable(true);
				frame.toFront();
				frame.repaint();

			}
		};

		frame.addFocusListener(foucslisner);
		progressBar.setIndeterminate(true);
		final JPanel contentPane = new JPanel();
		contentPane.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
		contentPane.setLayout(new BorderLayout());
		contentPane.add(new JLabel("Loading Please wait..."),
				BorderLayout.NORTH);
		contentPane.add(progressBar, BorderLayout.CENTER);
		frame.setContentPane(contentPane);
		frame.pack();
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);

		Runnable runnable = new Runnable() {
			public void run() {

				try {
					/*Code download product direct server database connection. */
					
					//ProductsDownloadController pdownload_controller = new ProductsDownloadController();
					//pdownload_controller.productsDownload();
					
					new HProductsDownloadHandler(frame).loadProducts();
					Thread.sleep(10000);

					// when loading is finished, make frame disappear
					SwingUtilities.invokeLater(new Runnable() {
						public void run() {
							frame.setVisible(false);
							frame.dispose();
						}
					});
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};
		new Thread(runnable).start();

	}

}
