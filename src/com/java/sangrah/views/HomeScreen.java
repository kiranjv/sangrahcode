package com.java.sangrah.views;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.ScrollPane;
import java.awt.Toolkit;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.border.BevelBorder;

public class HomeScreen extends JFrame {

	private JPanel HomePanel;
	private JPanel LeftPanel;
	private JPanel RightPanel;
	private Container container;

	public HomeScreen() {
		initGUI();
	}

	private void initGUI() {
		// initialize panels
		setTitle("Home");
		container = getContentPane();
		HomePanel = new JPanel();
		LeftPanel = new JPanel();
		RightPanel = new JPanel();
		container.add(HomePanel);

		LeftPanel.setBorder(BorderFactory
				.createEtchedBorder(BevelBorder.LOWERED));
		RightPanel.setBorder(BorderFactory
				.createEtchedBorder(BevelBorder.LOWERED));
		
		

		HomePanel.setLayout(new BorderLayout(2, 2));
		HomePanel.add(LeftPanel, BorderLayout.WEST);
		HomePanel.add(RightPanel, BorderLayout.CENTER);

		LeftPanel.add(new HomeLeftScreen());

		RightPanel.add(new InVoiceScreen());
		// init left panel
		// intiLeftPanel();

		JScrollPane thePane = new JScrollPane(HomePanel);
		container.add(thePane);
	}

	public static void main(String[] args) {
		HomeScreen homescreen = new HomeScreen();
		Toolkit tk = Toolkit.getDefaultToolkit();  
		int xSize = ((int) tk.getScreenSize().getWidth());  
		int ySize = ((int) tk.getScreenSize().getHeight());  
		homescreen.setSize(xSize, ySize);
		homescreen.show();

	}

}
