/**
 * 
 */
package com.java.sangrah.views;

import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Iterator;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.border.BevelBorder;
import javax.swing.border.SoftBevelBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

import com.java.sangrah.controllers.DBLocalHelper;
import com.java.sangrah.models.VtigerProducts;

/**
 * This code was edited or generated using CloudGarden's Jigloo
 * SWT/Swing GUI Builder, which is free for non-commercial
 * use. If Jigloo is being used commercially (ie, by a corporation,
 * company or business for any purpose whatever) then you
 * should purchase a license for each developer using Jigloo.
 * Please visit www.cloudgarden.com for details.
 * Use of Jigloo implies acceptance of these licensing terms.
 * A COMMERCIAL LICENSE HAS NOT BEEN PURCHASED FOR
 * THIS MACHINE, SO JIGLOO OR THIS CODE CANNOT BE USED
 * LEGALLY FOR ANY CORPORATE OR COMMERCIAL PURPOSE.
 */
/**
 * @author treewalker
 * 
 */
public class ProductSearchView_Old extends JFrame {

	private Container container;
	private DefaultTableModel table_invoiceModel;
	private JTable table_invoice;
	private int cell_width[] = { 5, 20, 100, 20, 20 };
	private String[] table_headder = { "S.No", "Barcode", "Productname",
			"Netprice", "QtyStock" };
	private JPanel mainpanel;
	private JPanel toppanel;
	private JPanel bottompanel;
	private JTextField barcode_field;
	private JLabel label_productnumber;

	public ProductSearchView_Old() {
		initGUI();
	}

	private void initGUI() {
		container = getContentPane();

		mainpanel = new JPanel();
		{
			label_productnumber = new JLabel();
			mainpanel.add(label_productnumber);
			label_productnumber.setLayout(null);
			label_productnumber.setBounds(854, 8, 122, 36);
			label_productnumber.setFont(new Font("Arial", Font.BOLD, 15));
			label_productnumber.setText("Barcode Number: ");
			label_productnumber
					.setPreferredSize(new java.awt.Dimension(161, 33));
		}
		toppanel = new JPanel();
		bottompanel = new JPanel();
		mainpanel.add(toppanel);
		mainpanel.add(bottompanel);

		mainpanel.setLayout(new FlowLayout(FlowLayout.CENTER, 10, 15));
		toppanel.setLayout(new FlowLayout());

		// initialize bar code textfield
		barcode_field = new JTextField();
		toppanel.add(barcode_field, new GridBagConstraints(1, 1, 1, 1, 0.0,
				0.0, GridBagConstraints.CENTER, GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));
		barcode_field.setBounds(13, 14, 358, 35);
		barcode_field.setName("barcode_field");
		barcode_field.setFont(new Font("Arial", Font.BOLD, 15));
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
				if (bar_code.length() >= 1) {
					System.out.println("bar_code: " + bar_code);
					// select * from vtiger_products where barcode like '4%'
					String hsql = "From "
							+ VtigerProducts.class.getSimpleName()
							+ " where barcode like '" + bar_code + "%'";
					System.out.println("Hsql:" + hsql);
					List<VtigerProducts> products = DBLocalHelper
							.executeHQuery(hsql);
					
						clearTableRows();
						addTableRows(convertToArray(products));
					
				}
			}

			@Override
			public void keyPressed(KeyEvent e) {
			}
		});

		/** Initialize table headder panle elements */
		table_invoiceModel = new DefaultTableModel(new String[][] {},
				table_headder);

		table_invoice = new JTable();
		table_invoice.setModel(table_invoiceModel);
		table_invoice.setLayout(null);
		table_invoice.setBounds(2, 49, 940, 300);
		table_invoice.setBorder(new SoftBevelBorder(BevelBorder.LOWERED, null,
				null, null, null));
		// make table formatting
		for (int i = 0; i < table_invoiceModel.getColumnCount(); i++) {
			formatTableCells(table_invoice.getColumnModel().getColumn(i),
					cell_width[i]);
		}

		JScrollPane scrollpane = new JScrollPane(table_invoice);
		scrollpane.setBounds(2, 8, 940, 290);
		bottompanel.add(scrollpane);
		scrollpane.setPreferredSize(new java.awt.Dimension(452, 403));
		container.add(mainpanel);
		mainpanel.setPreferredSize(new java.awt.Dimension(492, 521));
        this.setLocationRelativeTo(null);
		pack();
		setVisible(true);

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
		for (int i = rows -1; i >= 0; i--) {
			table_invoiceModel.removeRow(i);
		}
	}

	private String[][] convertToArray(List<VtigerProducts> products_list) {
		String array[][] = new String[products_list.size()][table_headder.length];
		int row_index = 0;
		for (Iterator iterator = products_list.iterator(); iterator.hasNext();) {
			VtigerProducts vtigerProducts = (VtigerProducts) iterator.next();
			array[row_index][0] = String.valueOf(row_index + 1);
			array[row_index][1] = vtigerProducts.getBarcode();
			array[row_index][2] = vtigerProducts.getProductname();
			array[row_index][3] = vtigerProducts.getNetprice();
			array[row_index][4] = vtigerProducts.getQtyinstock();
			row_index++;
		}
		return array;

	}

	public static void main(String[] args) {
		new ProductSearchView_Old();
	}

}
