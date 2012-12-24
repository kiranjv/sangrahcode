package com.java.sangrah.views;

import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import javax.swing.WindowConstants;
import javax.swing.border.BevelBorder;
import javax.swing.SwingUtilities;

import org.apache.log4j.Logger;

import com.java.sangrah.controllers.LoginController;
import com.java.sangrah.controllers.ProductsDownloadController;
import com.java.sangrah.repos.HCrmEntityRepository;

/**
 * This code was edited or generated using CloudGarden's Jigloo SWT/Swing GUI
 * Builder, which is free for non-commercial use. If Jigloo is being used
 * commercially (ie, by a corporation, company or business for any purpose
 * whatever) then you should purchase a license for each developer using Jigloo.
 * Please visit www.cloudgarden.com for details. Use of Jigloo implies
 * acceptance of these licensing terms. A COMMERCIAL LICENSE HAS NOT BEEN
 * PURCHASED FOR THIS MACHINE, SO JIGLOO OR THIS CODE CANNOT BE USED LEGALLY FOR
 * ANY CORPORATE OR COMMERCIAL PURPOSE.
 */
public class LoginPage extends javax.swing.JFrame {

	/**
	 * 
	 */
	private static Logger logger = Logger.getLogger(LoginPage.class);
	private static final long serialVersionUID = 1L;
	private JPanel mainpanel;
	private JLabel login_lable;
	private JLabel forget_password;
	private JButton submit_button;
	private JPasswordField pwd_textfield;
	private JLabel pwd_lable;
	private JTextField uname_textfield;
	private JLabel uname_lable;
	private JPanel loginpanel;

	/**
	 * Auto-generated main method to display this JFrame
	 */
	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
			SwingUtilities.invokeLater(new Runnable() {
				public void run() {
					LoginPage inst = new LoginPage();
					inst.setLocationRelativeTo(null);
					inst.setVisible(true);
				}
			});
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

	public LoginPage() {
		super();
		initGUI();
		logger.info("Login page initialization completed");

	}

	private void initGUI() {
		try {

			setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
			setTitle("Login Page");
			mainpanel = new JPanel();
			mainpanel.setLayout(null);
			mainpanel.setPreferredSize(new java.awt.Dimension(482, 324));
			getContentPane().add(mainpanel, BorderLayout.NORTH);

			// Create login header
			login_lable = new JLabel();
			mainpanel.add(login_lable, "North");
			login_lable.setText("Login");
			login_lable.setBounds(252, 76, 56, 43);
			login_lable.setFont(new java.awt.Font("Tahoma", 1, 16));

			// Create login header panel
			loginpanel = new JPanel();
			loginpanel.setLayout(null);
			loginpanel.setBounds(145, 156, 310, 129);
			loginpanel.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
			loginpanel.setEnabled(false);
			mainpanel.add(loginpanel, BorderLayout.CENTER);

			// User name text JLabel
			uname_lable = new JLabel();
			uname_lable.setText("Username");
			uname_lable.setLayout(null);
			uname_lable.setBounds(45, 10, 74, 14);
			loginpanel.add(uname_lable, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0,
						GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0),
						0, 0));

			// user name text JTextField
			uname_textfield = new JTextField();
			uname_textfield.setDoubleBuffered(true);
			uname_textfield.setBounds(149, 7, 137, 20);
			loginpanel.add(uname_textfield, new GridBagConstraints(2, 0, 2, 1, 0.0, 0.0,
						GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0),
						0, 0));

			// Password text JLabel
			pwd_lable = new JLabel();
			loginpanel.add(pwd_lable);
			pwd_lable.setText("Password");
			pwd_lable.setBounds(45, 41, 80, 14);

			// Create JPassword text field
			pwd_textfield = new JPasswordField();
			pwd_textfield.setBounds(149, 38, 137, 20);
			loginpanel.add(pwd_textfield);

			// Submit button
			submit_button = new JButton();
			submit_button.setText("Login");
			submit_button.setBounds(92, 83, 80, 23);
			submit_button.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent arg0) {

					System.out.println("Username: " + uname_textfield.getText() + " Password:"
								+ pwd_textfield.getText());

					// validate username and password
					if (uname_textfield.getText().isEmpty()) {
						JOptionPane.showMessageDialog(null, "Enter your username");
						return;
					}
					if (pwd_textfield.getPassword().length == 0) {
						JOptionPane.showMessageDialog(null, "Enter your passowrd");
						return;

					}
					// Make submit action to web server
					System.out.println("Submiting login data");
					final LoginController login_controller = new LoginController();
					boolean sucess = login_controller.doLogin(uname_textfield.getText(),
								pwd_textfield.getText());
					if (sucess) {

						// Display home screen
						logger.info("Login sucess");
						SwingUtilities.invokeLater(new Runnable() {
							public void run() {
								LoginPage.this.dispose();
								LoginPage.this.setVisible(false);
								/*
								 * System.out
								 * .println("Starting home screen layout.");
								 * HomeScreen homescreen = new HomeScreen();
								 * Toolkit tk = Toolkit.getDefaultToolkit(); int
								 * xSize = ((int) tk.getScreenSize()
								 * .getWidth()); int ySize = ((int)
								 * tk.getScreenSize() .getHeight());
								 * homescreen.setSize(xSize, ySize);
								 * homescreen.setFocusable(false);
								 * homescreen.show();
								 */

								try {
									UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
								} catch (Exception e) {
									e.printStackTrace();
								}
								InVoiceScreen screen = new InVoiceScreen();
								
								login_controller.doBackGroundProcess();

							}
						});

						// Download products data from server database
						// ProductsDownloadController product_controller = new
						// ProductsDownloadController();
						// product_controller.productsDownload();

					} else {
						JOptionPane.showMessageDialog(null, "Invalid username or password");
					}

				}
			});
			loginpanel.add(submit_button);

			// Forget password action JLable
			forget_password = new JLabel();
			loginpanel.add(forget_password);
			forget_password.setText("Forget password");
			forget_password.setLayout(null);
			forget_password.setBounds(203, 113, 105, 14);
			forget_password.addMouseListener(new MouseListener() {

				@Override
				public void mouseReleased(MouseEvent arg0) {
					// TODO Auto-generated method stub

				}

				@Override
				public void mousePressed(MouseEvent arg0) {
					System.out.println("mouse pressed");
				}

				@Override
				public void mouseExited(MouseEvent arg0) {
					// TODO Auto-generated method stub

				}

				@Override
				public void mouseEntered(MouseEvent arg0) {
					// TODO Auto-generated method stub

				}

				@Override
				public void mouseClicked(MouseEvent arg0) {
					// TODO Auto-generated method stub

				}
			});

			pack();
			setSize(600, 500);
			setResizable(false);
		} catch (Exception e) {
			// add your error handling code here
			System.err.println("Error occured while rendering login page widgets");
			e.printStackTrace();
		}
	}

}
