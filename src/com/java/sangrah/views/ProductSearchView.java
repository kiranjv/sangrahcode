/**
 * 
 */
package com.java.sangrah.views;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Iterator;
import java.util.List;

import javax.swing.AbstractAction;
import javax.swing.ActionMap;
import javax.swing.BorderFactory;
import javax.swing.ComponentInputMap;
import javax.swing.ImageIcon;
import javax.swing.InputMap;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.ListSelectionModel;
import javax.swing.border.LineBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.plaf.ActionMapUIResource;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumn;

import com.java.sangrah.controllers.DBLocalHelper;
import com.java.sangrah.models.VtigerProducts;

/**
 * This code was edited or generated using CloudGarden's Jigloo SWT/Swing GUI Builder, which is free
 * for non-commercial use. If Jigloo is being used commercially (ie, by a corporation, company or
 * business for any purpose whatever) then you should purchase a license for each developer using
 * Jigloo. Please visit www.cloudgarden.com for details. Use of Jigloo implies acceptance of these
 * licensing terms. A COMMERCIAL LICENSE HAS NOT BEEN PURCHASED FOR THIS MACHINE, SO JIGLOO OR THIS
 * CODE CANNOT BE USED LEGALLY FOR ANY CORPORATE OR COMMERCIAL PURPOSE.
 */
/**
 * @author treewalker
 * 
 */
public class ProductSearchView extends JFrame {

	private Container container;
	private DefaultTableModel table_invoiceModel;
	private JTable table_invoice;
	private int cell_width[] = { 40, 200, 20 };
	private String[] table_headder = { "Barcode Number", "Product Name", "Price" };
	private JPanel mainpanel;

	private JPanel leftpanel;
	private JTextField barcode_field;
	private JLabel label_productnumber;
	private JPanel rightpanel;
	private JLabel button_selectproduct;
	private JLabel button_goback;
	private JTableHeader tableHeader;
	private String[] current_rowselected = null;

	InVoiceScreen inVoiceScreen = null;

	public ProductSearchView(InVoiceScreen inVoiceScreen) {
		this.inVoiceScreen = inVoiceScreen;
		initGUI();
	}

	private void initGUI() {
		container = getContentPane();
		setDefaultCloseOperation(this.HIDE_ON_CLOSE);
		setResizable(false);
		setTitle("Search product");
		/* create main panel object */
		mainpanel = new JPanel();
		mainpanel.setLayout(new BorderLayout(5, 5));

		leftpanel = new JPanel();
		rightpanel = new JPanel();

		mainpanel.add(leftpanel, BorderLayout.WEST);
		mainpanel.add(rightpanel, BorderLayout.EAST);

		/* Initialize left side components */
		leftpanel.setLayout(new BorderLayout(1, 1));

		// initialize bar code textfield
		barcode_field = new JTextField();
		leftpanel.add(barcode_field, BorderLayout.NORTH);
		// barcode_field.setBounds(13, 14, 700, 35);
		barcode_field.setFont(new Font("Arial", Font.BOLD, 15));
		barcode_field.setBackground(new Color(255, 255, 196));
		barcode_field.setPreferredSize(new java.awt.Dimension(239, 38));
		barcode_field.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("barcode entered");
				table_invoice.setFocusable(true);
			}

		});

		// add key listener
		barcode_field.addKeyListener(new KeyListener() {

			@Override
			public void keyTyped(KeyEvent e) {
			}

			@Override
			public void keyReleased(KeyEvent e) {
				String bar_code = barcode_field.getText();

				if(e.getKeyCode() == 40) {
					System.out.println("Pressed down");
					if(table_invoice.getRowCount() >= 0) {
						table_invoice.requestFocus(true);
					}
					
				}
				if (bar_code.length() >= 1) {
					System.out.println("bar_code: " + bar_code);
					boolean is_number = isNumeric(bar_code);
					if (is_number) {
						// select * from vtiger_products where barcode like '4%'
						String hsql = "From " + VtigerProducts.class.getSimpleName() + " where barcode like '" + bar_code + "%'";
						System.out.println("Hsql:" + hsql);
						List<VtigerProducts> products = DBLocalHelper.executeHQuery(hsql);

						clearTableRows();
						addTableRows(convertToArray(products));
						if(table_invoice.getRowCount() >= 0) {
						table_invoice.setRowSelectionInterval(0, 0);
						}
						
					} else {
						// select * from vtiger_products where barcode like '4%'
						String hsql = "From " + VtigerProducts.class.getSimpleName() + " where productname like '" + bar_code + "%'";
						System.out.println("Hsql:" + hsql);
						List<VtigerProducts> products = DBLocalHelper.executeHQuery(hsql);

						clearTableRows();
						addTableRows(convertToArray(products));
						if(table_invoice.getRowCount() > 0) {
						table_invoice.setRowSelectionInterval(0, 0);
						}
						
					}

				}
			}

			@Override
			public void keyPressed(KeyEvent e) {
			}

			public boolean isNumeric(String str) {
				return str.matches("-?\\d+(.\\d+)?");
			}
		});

		/* Initialize table header panel elements */
		// table_invoiceModel = new DefaultTableModel(new String[][] {}, table_headder);
		table_invoiceModel = new DefaultTableModel(new String[][] {}, table_headder);

		table_invoice = new JTable();
		table_invoice.setModel(table_invoiceModel);
		table_invoice.setLayout(null);
		table_invoice.setForeground(Color.BLACK);
		table_invoice.setBackground(Color.white);
		table_invoice.setFont(new Font("Arial", Font.BOLD, 14));
		table_invoice.setOpaque(true);
		table_invoice.setRowMargin(10);
		table_invoice.setRowHeight(30);
		table_invoice.setRowSelectionAllowed(true);
		table_invoice.setColumnSelectionAllowed(false);
		table_invoice.setSelectionBackground(new Color(30, 57, 253));
		table_invoice.setSelectionForeground(new Color(96, 142, 251));
		ListSelectionModel selectionModel = table_invoice.getSelectionModel();
		selectionModel.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		selectionModel.addListSelectionListener(new RowListener(table_invoice));
		// table_invoice.setBounds(2, 49, 940, 300);
		table_invoice.setBorder(LineBorder.createBlackLineBorder());

		tableHeader = table_invoice.getTableHeader();
		tableHeader.setBackground(Color.GRAY);
		tableHeader.setForeground(Color.BLACK);
		tableHeader.setFont(new Font("Arial", Font.BOLD, 12));
		tableHeader.setVisible(false);

		// make table formatting
		for (int i = 0; i < table_invoiceModel.getColumnCount(); i++) {
			formatTableCells(table_invoice.getColumnModel().getColumn(i), cell_width[i]);
			table_invoice.setRowMargin(10);
		}

		addActionMappings();

		JScrollPane scrollpane = new JScrollPane(table_invoice);
		scrollpane.setBounds(2, 8, 940, 290);
		scrollpane.setBackground(Color.GRAY);
		scrollpane.setForeground(Color.BLACK);
		scrollpane.setOpaque(true);
		leftpanel.add(scrollpane);
		scrollpane.setPreferredSize(new java.awt.Dimension(452, 403));

		/* Initialize right side jpanel buttons */
		rightpanel = new JPanel();
		rightpanel.setLayout(new BorderLayout(2, 2));

		/* Initialize select button */
		button_selectproduct = new JLabel(new ImageIcon("resources/Resized-SelectProduct.jpg"));
		button_selectproduct.setSize(200, 200);
		button_selectproduct.addMouseListener(new MouseAdapter() {
			public void mouseReleased(MouseEvent e) {

				if (!e.isPopupTrigger()) {
					addProduct_InvoiceScreenTable();
					ProductSearchView.this.dispose();
					ProductSearchView.this.show(false);
				}
			}
		});

		button_goback = new JLabel(new ImageIcon("resources/Resized-GoBack.jpg"));
		button_goback.setSize(200, 200);
		button_goback.addMouseListener(new MouseAdapter() {
			public void mouseReleased(MouseEvent e) {

				if (!e.isPopupTrigger()) {
					ProductSearchView.this.dispose();
					ProductSearchView.this.show(false);
				}
			}
		});

		rightpanel.add(button_selectproduct, BorderLayout.NORTH);
		rightpanel.add(button_goback, BorderLayout.SOUTH);
		mainpanel.add(rightpanel);

		container.add(mainpanel);
		// mainpanel.setPreferredSize(new java.awt.Dimension(800, 650));
		// this.setLocationRelativeTo(null);
		Toolkit tk = Toolkit.getDefaultToolkit();
		Dimension screenSize = tk.getScreenSize();
		int screenHeight = screenSize.height;
		int screenWidth = screenSize.width;
		setSize(screenWidth / 2, screenHeight / 2);
		setLocation(screenWidth / 4, screenHeight / 4);
		pack();
		setVisible(true);

	}

	private void addActionMappings() {
		// Add enter key event action map to table
		KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
		table_invoice.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(enter, "solve");
		table_invoice.getActionMap().put("solve", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				addProduct_InvoiceScreenTable();
				ProductSearchView.this.dispose();
				ProductSearchView.this.show(false);
			}
		});

		// Barcode select keymap

		KeyStroke escape = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
		table_invoice.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(escape, "barcode");
		table_invoice.getActionMap().put("barcode", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("barcode select action performed.");
				barcode_field.setText("");
				barcode_field.requestFocus(true);
			}
		});

		
	}

	private void formatTableCells(TableColumn column, int width) {
		column.setPreferredWidth(width);
	}

	private void addTableRows(String[][] products_array) {
		for (int i = 0; i < products_array.length; i++) {
			table_invoiceModel.addRow(products_array[i]);
		}
	}

	private void clearTableRows() {
		int rows = table_invoiceModel.getRowCount();
		for (int i = rows - 1; i >= 0; i--) {
			table_invoiceModel.removeRow(i);
		}
	}

	private String[][] convertToArray(List<VtigerProducts> products_list) {
		String array[][] = new String[products_list.size()][table_headder.length];
		int row_index = 0;
		for (Iterator iterator = products_list.iterator(); iterator.hasNext();) {
			VtigerProducts vtigerProducts = (VtigerProducts) iterator.next();
			array[row_index][0] = vtigerProducts.getBarcode();
			array[row_index][1] = vtigerProducts.getProductname();
			array[row_index][2] = vtigerProducts.getNetprice();
			row_index++;
		}
		return array;

	}

	class RowListener implements ListSelectionListener {

		JTable table;

		public RowListener(JTable table_invoice) {
			table = table_invoice;
		}

		public void valueChanged(ListSelectionEvent e) {
			if (!e.getValueIsAdjusting()) {
				ListSelectionModel model = table.getSelectionModel();
				int lead = model.getLeadSelectionIndex();
				displayRowValues(lead);
			}
		}

		private void displayRowValues(int rowIndex) {
			int rows = table.getRowCount();
			if (rowIndex < rows) {
				int columns = table.getColumnCount();
				String selectedrow[] = new String[columns];
				String s = "";
				for (int col = 0; col < columns; col++) {
					Object o = table.getValueAt(rowIndex, col);
					s += o.toString();
					selectedrow[col] = o.toString();
					if (col < columns - 1)
						s += ", ";
				}
				current_rowselected = selectedrow;
				System.out.println(s);
			}
		}
	}

	private void addProduct_InvoiceScreenTable() {
		System.out.println("Current selected product: " + current_rowselected);
		inVoiceScreen.addInvoiceTableRow(current_rowselected[0]);
	}

	public static void main(String[] args) {
		new ProductSearchView(new InVoiceScreen());
	}

}
