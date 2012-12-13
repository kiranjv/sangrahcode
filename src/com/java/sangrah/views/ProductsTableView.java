/**
 * 
 */
package com.java.sangrah.views;

import java.awt.Container;
import java.util.Iterator;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.BevelBorder;
import javax.swing.border.SoftBevelBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

import com.java.sangrah.controllers.DBLocalHelper;
import com.java.sangrah.models.VtigerProducts;

/**
 * @author treewalker
 * 
 */
public class ProductsTableView extends JFrame {

	Container container = null;
	private DefaultTableModel table_invoiceModel;
	private JTable table_invoice;
	private int cell_width[] = { 5, 20, 100, 20, 20 };
	private String[] table_headder = { "S.No", "Barcode", "Productname",
			"Netprice", "QtyStock" };
	private String[][] products;

	/**
	 * @param args
	 */
	public ProductsTableView() {
		products = readProductsData();
		initGUI();
		addTableRows(products);

	}

	

	private void initGUI() {
		container = getContentPane();
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
		container.add(scrollpane);
		setSize(500, 700);
		this.setLocationRelativeTo(null);
		pack();
		setVisible(true);

	}

	private String[][] readProductsData() {
		List<VtigerProducts> products_list = DBLocalHelper.readRecords(VtigerProducts.class.getSimpleName());
		
		products = convertToArray(products_list);
		return products;
	}

	private void addTableRows(String[][] products_array) {
		for (int i = 0; i < products_array.length; i++) {
			table_invoiceModel.addRow(products_array[i]);
		}
		
	}
	private String[][] convertToArray(List<VtigerProducts> products_list) {
		String array[][] = new String[products_list.size()][table_headder.length];
		int row_index = 0;
		for (Iterator iterator = products_list.iterator(); iterator.hasNext();) {
			VtigerProducts vtigerProducts = (VtigerProducts) iterator.next();
			array[row_index][0] = String.valueOf(row_index+1);
			array[row_index][1] = vtigerProducts.getBarcode();
			array[row_index][2] = vtigerProducts.getProductname();
			array[row_index][3] = vtigerProducts.getNetprice();
			array[row_index][4] = vtigerProducts.getQtyinstock();
			row_index++;
		}
		return array;
		
		
	}

	private void formatTableCells(TableColumn column, int width) {
		column.setPreferredWidth(width);
	}

	public static void main(String[] args) {
		new ProductsTableView();

	}

}
