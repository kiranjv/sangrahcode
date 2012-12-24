package com.java.sangrah.views;

import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import java.awt.Paint;
import java.awt.Point;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.AdjustmentEvent;
import java.awt.event.AdjustmentListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.swing.AbstractAction;
import javax.swing.ActionMap;
import javax.swing.BorderFactory;
import javax.swing.ComponentInputMap;
import javax.swing.ImageIcon;
import javax.swing.InputMap;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.SpinnerListModel;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.border.BevelBorder;
import javax.swing.border.LineBorder;
import javax.swing.border.SoftBevelBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.plaf.ActionMapUIResource;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumn;

import org.jdesktop.application.Application;

import com.java.sangrah.controllers.DBLocalHelper;
import com.java.sangrah.controllers.InvoiceController;
import com.java.sangrah.controllers.InvoicePrintController;
import com.java.sangrah.controllers.RoyalityController;
import com.java.sangrah.models.InvoiceProduct;
import com.java.sangrah.models.VtigerContactdetails;
import com.java.sangrah.models.VtigerContactroyality;
import com.java.sangrah.models.VtigerProducts;
import com.java.sangrah.models.VtigerRoyality;
import com.java.sangrah.models.VtigerWarehousestoreInventorytransaction;
import com.java.sangrah.utils.DateUtils;
import com.java.sangrah.utils.Util;

/**
 * This code was edited or generated using CloudGarden's Jigloo SWT/Swing GUI Builder, which is free
 * for non-commercial use. If Jigloo is being used commercially (ie, by a corporation, company or
 * business for any purpose whatever) then you should purchase a license for each developer using
 * Jigloo. Please visit www.cloudgarden.com for details. Use of Jigloo implies acceptance of these
 * licensing terms. A COMMERCIAL LICENSE HAS NOT BEEN PURCHASED FOR THIS MACHINE, SO JIGLOO OR THIS
 * CODE CANNOT BE USED LEGALLY FOR ANY CORPORATE OR COMMERCIAL PURPOSE.
 */
public class InVoiceScreen extends javax.swing.JFrame {
	private JPanel mainPanel;
	private JLabel label_barcodefocus;
	private JLabel label_saveinvoice;
	private JLabel label_goup;
	private JLabel label_godown;
	private JLabel jLabel15;
	private JLabel jLabel14;
	private JLabel jLabel13;
	private JLabel jLabel12;
	private JLabel jLabel11;
	private JLabel jLabel10;
	private JTable table_invoice;
	private JLabel label_fotterimage;
	private JTextField royeltyno_mainfield;
	private JPanel RoyeltyPanel_Box;
	private JPanel ItemsPanel_Box;
	private JLabel label_royaltynumber;
	private JTextField barcode_field;
	private JTextField royelty_update_field;
	private JPanel tableheaderpanel;
	private JTextField redeem_royaltypoints_field;
	private JTextField Total_money_earned_field;
	private JTextField total_royaltypoints_field;
	private JLabel label_redeem_royalpoints;
	private JLabel label_totalmoney_earned;
	private JLabel label_royalpoints;

	private JTextField textfield_customername;
	private JLabel label_customername;
	private JTextField textfield_customer_mobileno;
	private JLabel label_customer_mobileno;
	private JLabel label_royaltyno;
	private JLabel label_grandtotal;
	private JLabel totalamount_lable;
	private JLabel grandtotal_lable;
	private JLabel discountamount_lable;
	private JLabel label_discount;
	private JLabel label_totalamount;
	private JLabel jLabel17;
	private JLabel jLabel16;
	private JPanel barcode_panel;
	private JLabel label_selectquantity;
	private JLabel label_deleteitem;
	private JLabel label_shortcutkeys;
	private JScrollPane spane;
	private int cell_width[] = { 20, 200, 40, 20, 20, 20, 40 };
	private DefaultTableModel table_invoiceModel;
	private int previous_quantity = 0;

	public static String[] producttable_headder = { "Bar Code", "Item Name", "Rate ", "Qty", "Dis(%)", "VAT(%)", "MRP" };
	private JLabel label_rsamount;
	private JLabel lable_numitems;
	private JTextField field_date;
	private JLabel label_date;
	private JTextField field_counterno;
	private JLabel lableh_counterno;
	private JSpinner username_spinner;
	private JLabel lable_user;
	private JButton button_cashtender;
	private JButton button_voidall;
	private JButton button_cardpayment;
	private JButton button_foodcoupons;
	private JButton button_salesreturn;
	private JButton button_productlookup;
	private JPanel ButtonsPanel;

	public static final int barcode_index = 0;
	public static final int productname_index = 1;
	public static final int unitprice_index = 2;
	public static final int qty_index = 3;
	public static final int discount_index = 4;
	public static final int vat_index = 5;
	public static final int mrp_index = 6;
	protected static final String RIGHTOFFSET = "  ";

	private boolean CELLUPDATE = false;

	private HashMap<String, VtigerProducts> products_hashmap;
	List<InvoiceProduct> invoceproduct_list = null;
	private String[] netprice_list = null;
	/** total total amount for all items */
	private float invoice_totalamount = 0;
	/** total discount amount for all items */
	private int invoice_totalitemsdiscount = 0;
	/** total royal discount amount for all items */
	private float invoice_royaltydiscount = 0;
	/** total grand amount for all items */
	private float invoice_grandamount = 0;
	private JTableHeader tabelheadder;
	private int row_selected = -1;
	private String[][] tabledata;
	private HashMap<String, String> royality_hashmap = null;

	/**
	 * Auto-generated main method to display this JInternalFrame inside a new JFrame.
	 */
	public static void main(String[] args) {
		// jdp.setPreferredSize(inst.getPreferredSize());
		try {
			// UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
		} catch (Exception e) {
			e.printStackTrace();
		}
		InVoiceScreen screen = new InVoiceScreen();
		Toolkit tk = Toolkit.getDefaultToolkit();
		int xSize = ((int) tk.getScreenSize().getWidth());
		int ySize = ((int) tk.getScreenSize().getHeight());

		screen.setTitle("Invoice");
		screen.show();
		/*
		 * JFrame frame = new JFrame(); frame.setSize(xSize, ySize - 10);
		 * System.out.println("xSize, ySize: " + xSize + "" + ySize); frame.add(screen);
		 * frame.setTitle("Invoice"); frame.show();
		 */

	}

	public InVoiceScreen() {
		super();
		products_hashmap = new HashMap<String, VtigerProducts>();
		initGUI();
		setVisible(true);
		setTitle("Invoice Page");
		show();

	}

	private void initGUI() {
		try {
			setDefaultCloseOperation(this.EXIT_ON_CLOSE);
			Toolkit tk = Toolkit.getDefaultToolkit();
			int xSize = ((int) tk.getScreenSize().getWidth());
			int ySize = ((int) tk.getScreenSize().getHeight());
			// setSize(xSize, ySize);
			this.setPreferredSize(new java.awt.Dimension(xSize, ySize));
			this.setBounds(0, 0, xSize, ySize);
			setVisible(true);
			// this.setTitle("InVoice Screen");
			this.setLayout(null);
			this.setSize(1440, 900);

			mainPanel = new JPanel();
			mainPanel.setBackground(new Color(151, 221, 251));
			barcode_panel = new JPanel();
			ItemsPanel_Box = new JPanel();
			tableheaderpanel = new JPanel();
			RoyeltyPanel_Box = new JPanel();

			this.add(mainPanel);
			mainPanel.setLayout(null);
			mainPanel.setBounds(0, 0, 1440, 889);
			mainPanel.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
			mainPanel.setName("mainPanel");

			/** Initialize barcode panel layout. */

			// initialize shortcut key labels
			label_shortcutkeys = new JLabel();
			mainPanel.add(label_shortcutkeys);
			label_shortcutkeys.setLayout(null);
			label_shortcutkeys.setBounds(9, 779, 129, 14);
			label_shortcutkeys.setName("label_shortcutkeys");
			label_shortcutkeys.setText("Shortcut Keys >>");

			label_barcodefocus = new JLabel();
			mainPanel.add(label_barcodefocus);
			label_barcodefocus.setLayout(null);
			label_barcodefocus.setBounds(138, 779, 170, 14);
			label_barcodefocus.setName("label_barcodefocus");
			label_barcodefocus.setText("[Barcode Focus :: ALT + B]");

			label_saveinvoice = new JLabel();
			mainPanel.add(label_saveinvoice);
			label_saveinvoice.setLayout(null);
			label_saveinvoice.setBounds(343, 779, 170, 14);
			label_saveinvoice.setName("label_saveinvoice");
			label_saveinvoice.setText("[Save InVoice :: Alt + M]");

			label_goup = new JLabel();
			mainPanel.add(label_goup);
			label_goup.setLayout(null);
			label_goup.setBounds(545, 779, 170, 14);
			label_goup.setName("label_goup");
			label_goup.setText("[Go Up :: Alt + Arrow Up]");

			label_godown = new JLabel();
			mainPanel.add(label_godown);
			label_godown.setLayout(null);
			label_godown.setBounds(736, 779, 170, 14);
			label_godown.setName("label_godown");
			label_godown.setText("[Go Down :: Alt + Arrow Down]");

			label_deleteitem = new JLabel();
			mainPanel.add(label_deleteitem);
			label_deleteitem.setLayout(null);
			label_deleteitem.setBounds(977, 779, 191, 14);
			label_deleteitem.setName("label_deleteitem");
			label_deleteitem.setText("[Delete item :: Ctrl + D]");

			label_selectquantity = new JLabel();
			mainPanel.add(label_selectquantity);
			label_selectquantity.setBounds(1200, 779, 212, 14);
			label_selectquantity.setName("label_selectquantity");
			label_selectquantity.setText("[Select Quantity :: Alt + Q]");

			// initialize bar code panel elements
			mainPanel.add(barcode_panel);
			barcode_panel.setLayout(null);
			barcode_panel.setBounds(2, 6, 1074, 109);
			barcode_panel.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
			barcode_panel.setName("barcode_panel");
			barcode_panel.setBackground(new Color(255, 255, 255));

			// initialize bar code textfield
			barcode_field = new JTextField();
			barcode_panel.add(barcode_field, new GridBagConstraints(1, 1, 1, 1, 0.0, 0.0, GridBagConstraints.CENTER, GridBagConstraints.NONE,
						new Insets(0, 0, 0, 0), 0, 0));
			barcode_field.setBounds(2, 55, 791, 44);
			barcode_field.setName("barcode_field");
			barcode_field.setFont(new Font("Arail", Font.BOLD, 15));
			barcode_field.setBackground(new Color(255, 255, 196));
			{
				lable_user = new JLabel("USER");
				barcode_panel.add(lable_user);
				lable_user.setBounds(6, 10, 66, 31);
				lable_user.setName("lable_user");
				lable_user.setBackground(new Color(255, 255, 255));
				lable_user.setOpaque(true);
				lable_user.setFont(new Font("Arial", Font.BOLD, 16));
			}
			{
				SpinnerListModel jSpinner1Model = new SpinnerListModel(new String[] { "Kiran", "Kiran2", "Kiran3" });
				username_spinner = new JSpinner();
				barcode_panel.add(username_spinner);
				username_spinner.setModel(jSpinner1Model);
				username_spinner.setBounds(104, 9, 181, 32);
				username_spinner.setName("jSpinner1");
				username_spinner.getEditor().setBackground(new java.awt.Color(0, 0, 0));
				username_spinner.getEditor().setAutoscrolls(true);
				username_spinner.getEditor().setFont(new java.awt.Font("Arial", 1, 18));
				username_spinner.getEditor().setForeground(new java.awt.Color(192, 192, 192));
				username_spinner.getEditor().setOpaque(false);
				username_spinner.setEnabled(false);
				username_spinner.setFont(new Font("Arial", Font.BOLD, 18));
				username_spinner.setBackground(new Color(192, 192, 192));
				username_spinner.setForeground(new Color(0, 0, 0));
			}
			{
				lableh_counterno = new JLabel("Counter No.");
				barcode_panel.add(lableh_counterno);
				lableh_counterno.setBounds(331, 10, 121, 36);
				lableh_counterno.setName("lableh_counterno");
				lableh_counterno.setBackground(new Color(255, 255, 255));
				lableh_counterno.setFont(new Font("Arial", Font.BOLD, 16));
			}
			{
				field_counterno = new JTextField("001");
				barcode_panel.add(field_counterno);
				field_counterno.setBounds(452, 13, 56, 34);
				field_counterno.setName("field_cunterno");
				field_counterno.setHorizontalAlignment(SwingConstants.CENTER);
				field_counterno.setEditable(false);
				field_counterno.setBackground(new Color(217, 247, 253));
				field_counterno.setFocusable(false);
				field_counterno.setFont(new Font("Arial", Font.BOLD, 14));

			}
			{
				label_date = new JLabel("Date");
				barcode_panel.add(label_date);
				label_date.setName("label_date");
				label_date.setBounds(576, 10, 48, 36);
				label_date.setBackground(new Color(255, 255, 255));
				label_date.setFont(new Font("Arial", Font.BOLD, 16));

			}
			{
				field_date = new JTextField();
				barcode_panel.add(field_date);
				field_date.setName("field_date");
				field_date.setBounds(645, 12, 148, 35);
				field_date.setHorizontalAlignment(SwingConstants.CENTER);
				field_date.setText(DateUtils.getDate(System.currentTimeMillis()));
				field_date.setBackground(new Color(217, 247, 253));
				field_date.setEditable(false);
				field_date.setFocusable(false);
				field_date.setFont(new Font("Arial", Font.BOLD, 14));

			}
			{
				lable_numitems = new JLabel(" Items:    0 ");
				barcode_panel.add(lable_numitems);
				lable_numitems.setBounds(803, 2, 259, 49);
				lable_numitems.setName("lable_numitems");
				lable_numitems.setBackground(new Color(192, 192, 192));
				lable_numitems.setFont(new Font("Arial", Font.BOLD, 20));
				lable_numitems.setOpaque(true);
			}
			{
				label_rsamount = new JLabel("Rs. 00.00");
				barcode_panel.add(label_rsamount);
				label_rsamount.setName("label_rsamount");
				label_rsamount.setBounds(803, 52, 259, 49);
				label_rsamount.setHorizontalAlignment(SwingConstants.CENTER);
				label_rsamount.setBackground(new Color(192, 192, 192));
				label_rsamount.setOpaque(true);
				label_rsamount.setFont(new Font("Arial", Font.BOLD, 20));

			}
			barcode_field.addActionListener(barcode_field_listener);

			/** End of the barcode panel initialization. */

			/** Initialize ItemsPanel elements. */

			// initialize items table labels
			mainPanel.add(ItemsPanel_Box);
			ItemsPanel_Box.setLayout(null);
			ItemsPanel_Box.setBounds(4, 110, 1072, 641);
			ItemsPanel_Box.setBorder(BorderFactory.createEtchedBorder(new java.awt.Color(255, 255, 128), null));
			ItemsPanel_Box.setName("ItemsPanel_Box");
			ItemsPanel_Box.setBackground(new Color(236, 255, 255));

			/** Initialize table headder panle elements */
			table_invoiceModel = new DefaultTableModel(new String[][] {}, producttable_headder);
			table_invoice = new JTable(table_invoiceModel) {
				public Class getColumnClass(int column) {
					return getValueAt(0, column).getClass();
				}

				public Component prepareRenderer(TableCellRenderer renderer, int row, int column) {
					Component c = super.prepareRenderer(renderer, row, column);
					JComponent jc = (JComponent) c;
					if (!isRowSelected(row))
						c.setBackground(Color.white);
					return c;
				}

				@Override
				public boolean isCellEditable(int row, int column) {
					if (column == qty_index || column == discount_index)
						return true;
					return false;
				}

			};
			// table_invoice.setCellSelectionEnabled(false);
			// ListSelectionModel cellSelectionModel =
			// table_invoice.getSelectionModel();
			// cellSelectionModel.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
			// cellSelectionModel.addListSelectionListener(new
			// SelectionListener());

			table_invoice.setLayout(null);
			table_invoice.setBounds(2, 49, 940, 300);
			table_invoice.setIntercellSpacing(new Dimension(10, 50));
			table_invoice.setFont(new Font("Arail", Font.CENTER_BASELINE, 12));
			table_invoice.setForeground(Color.BLACK);
			table_invoice.setBackground(Color.white);
			table_invoice.setOpaque(true);
			table_invoice.setRowMargin(12);
			table_invoice.setRowHeight(40);
			table_invoice.setFont(new Font("Arial", Font.BOLD, 14));
			table_invoice.setBorder(new SoftBevelBorder(BevelBorder.LOWERED, null, null, null, null));
			table_invoice.setName("table_invoice");
			table_invoice.setBackground(new Color(151, 221, 251));

			tabelheadder = table_invoice.getTableHeader();
			tabelheadder.setBackground(Color.GRAY);
			tabelheadder.setBorder(new LineBorder(new java.awt.Color(0, 0, 0), 1, true));
			tabelheadder.setForeground(Color.BLACK);
			tabelheadder.setFont(new Font("Arial", Font.BOLD, 15));
			tabelheadder.setOpaque(true);
			// adding cell value change listener
			addTableListener();

			// make table formatting
			for (int i = 0; i < table_invoiceModel.getColumnCount(); i++) {
				TableColumn column = table_invoice.getColumnModel().getColumn(i);
				if (i >= 2) {
					DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
					centerRenderer.setHorizontalAlignment(JLabel.RIGHT);
					column.setCellRenderer(centerRenderer);
				}
				formatTableCells(column, cell_width[i]);
			}

			JScrollPane scrollpane = new JScrollPane(table_invoice);
			scrollpane.setBounds(-2, 5, 1064, 362);
			tableheaderpanel.setLayout(null);
			tableheaderpanel.setBounds(2, 0, 1058, 366);
			tableheaderpanel.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED));
			tableheaderpanel.setName("tableheaderpanel");
			tableheaderpanel.add(scrollpane);
			tableheaderpanel.setBackground(new Color(236, 255, 255));
			scrollpane.setName("scrollpane");
			scrollpane.setBorder(new LineBorder(new java.awt.Color(127, 157, 185), 1, true));
			scrollpane.setAutoscrolls(true);
			scrollpane.setBackground(new Color(236, 255, 255));
			scrollpane.setFont(new Font("Arial", Font.BOLD, 14));

			ItemsPanel_Box.add(tableheaderpanel);
			/** End of the table headder panel elements. */

			label_totalamount = new JLabel("Total: ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(label_totalamount);
			label_totalamount.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null, new java.awt.Color(192, 192, 192)));
			label_totalamount.setLayout(null);
			label_totalamount.setName("label_totalamount");
			label_totalamount.setVerticalAlignment(SwingConstants.CENTER);
			label_totalamount.setBounds(2, 371, 804, 56);
			label_totalamount.setFont(new Font("Arial", Font.BOLD, 18));

			label_discount = new JLabel("(-) Royalty Discount: ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(label_discount);
			label_discount.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null, new java.awt.Color(192, 192, 192)));
			label_discount.setLayout(null);
			label_discount.setName("label_discount");
			label_discount.setVerticalAlignment(SwingConstants.CENTER);
			label_discount.setBounds(2, 426, 804, 56);
			label_discount.setFont(new Font("Arial", Font.BOLD, 18));

			label_grandtotal = new JLabel("Grand Total: ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(label_grandtotal);
			label_grandtotal.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null, new java.awt.Color(192, 192, 192)));
			label_grandtotal.setLayout(null);
			label_grandtotal.setName("label_grandtotal");
			label_grandtotal.setVerticalAlignment(SwingConstants.CENTER);
			label_grandtotal.setBounds(2, 482, 804, 56);
			label_grandtotal.setFont(new Font("Arial", Font.BOLD, 18));

			totalamount_lable = new JLabel("00.00  ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(totalamount_lable);
			totalamount_lable.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null, new java.awt.Color(192, 192, 192)));
			totalamount_lable.setLayout(null);
			totalamount_lable.setVerticalAlignment(SwingConstants.CENTER);
			totalamount_lable.setBounds(806, 372, 254, 54);
			totalamount_lable.setName("totalamount_lable");
			totalamount_lable.setFont(new Font("Arial", Font.BOLD, 18));

			discountamount_lable = new JLabel("00.00  ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(discountamount_lable);
			discountamount_lable.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null, new java.awt.Color(192, 192, 192)));
			discountamount_lable.setLayout(null);
			discountamount_lable.setVerticalAlignment(SwingConstants.CENTER);
			discountamount_lable.setBounds(806, 425, 254, 58);
			discountamount_lable.setFont(new Font("Arial", Font.BOLD, 18));

			grandtotal_lable = new JLabel("00.00  ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(grandtotal_lable);
			grandtotal_lable.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null, new java.awt.Color(192, 192, 192)));
			grandtotal_lable.setLayout(null);
			discountamount_lable.setVerticalAlignment(SwingConstants.CENTER);
			discountamount_lable.setName("discountamount_lable");
			grandtotal_lable.setFont(new Font("Arial", Font.BOLD, 18));

			grandtotal_lable.setBounds(806, 483, 254, 55);
			grandtotal_lable.setName("grandtotal_lable");

			/** End of the Items panel elements initialization. */

			/** Initialize Royalty panel elements. */

			mainPanel.add(RoyeltyPanel_Box);
			RoyeltyPanel_Box.setLayout(null);
			RoyeltyPanel_Box.setBounds(1080, 309, 353, 442);
			RoyeltyPanel_Box.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
			RoyeltyPanel_Box.setLayout(null);
			RoyeltyPanel_Box.setName("RoyeltyPanel_Box");
			RoyeltyPanel_Box.setBackground(new Color(236, 255, 255));

			// Initialize royalty panel headder

			// initilize royalty no label
			label_royaltyno = new JLabel();
			label_royaltyno.setLayout(null);
			label_royaltyno.setBounds(28, 110, 141, 26);
			label_royaltyno.setName("label_royaltyno");
			RoyeltyPanel_Box.add(label_royaltyno);
			label_royaltyno.setText("Royalty No.");

			royelty_update_field = new JTextField();
			RoyeltyPanel_Box.add(royelty_update_field);
			royelty_update_field.setBounds(179, 110, 157, 30);
			royelty_update_field.setName("royelty_update_field");
			royelty_update_field.setEditable(false);
			royelty_update_field.setFont(new Font("Arail", Font.BOLD, 12));

			label_customer_mobileno = new JLabel();
			RoyeltyPanel_Box.add(label_customer_mobileno);
			label_customer_mobileno.setLayout(null);
			label_customer_mobileno.setBounds(28, 153, 141, 26);
			label_customer_mobileno.setName("label_customer_mobileno");
			label_customer_mobileno.setText("Customer Mobile No.");

			textfield_customer_mobileno = new JTextField();
			RoyeltyPanel_Box.add(textfield_customer_mobileno);
			textfield_customer_mobileno.setBounds(179, 153, 157, 30);
			textfield_customer_mobileno.setName("textfield_customer_mobileno");
			textfield_customer_mobileno.setFont(new Font("Arail", Font.BOLD, 12));

			label_customername = new JLabel();
			RoyeltyPanel_Box.add(label_customername);
			label_customername.setLayout(null);
			label_customername.setBounds(28, 199, 141, 26);
			label_customername.setName("label_customername");
			label_customername.setText("Customer Name");

			textfield_customername = new JTextField();
			RoyeltyPanel_Box.add(textfield_customername);
			textfield_customername.setBounds(179, 197, 157, 30);
			textfield_customername.setFont(new Font("Arail", Font.BOLD, 12));

			label_royalpoints = new JLabel();
			RoyeltyPanel_Box.add(label_royalpoints);
			label_royalpoints.setLayout(null);
			label_royalpoints.setBounds(18, 242, 146, 26);
			label_royalpoints.setName("label_royalpoints");
			label_royalpoints.setText("Total Royal Points");

			label_totalmoney_earned = new JLabel();
			RoyeltyPanel_Box.add(label_totalmoney_earned);
			label_totalmoney_earned.setLayout(null);
			label_totalmoney_earned.setBounds(18, 285, 146, 26);
			label_totalmoney_earned.setName("label_totalmoney_earned");
			label_totalmoney_earned.setText("Total money earned");

			label_redeem_royalpoints = new JLabel();
			RoyeltyPanel_Box.add(label_redeem_royalpoints);
			label_redeem_royalpoints.setLayout(null);
			label_redeem_royalpoints.setBounds(18, 324, 146, 26);
			label_redeem_royalpoints.setName("label_redeem_royalpoints");
			label_redeem_royalpoints.setText("Redeem Royalty Points");

			total_royaltypoints_field = new JTextField();
			RoyeltyPanel_Box.add(total_royaltypoints_field);
			total_royaltypoints_field.setBounds(179, 240, 157, 30);
			total_royaltypoints_field.setEditable(false);
			total_royaltypoints_field.setFont(new Font("Arail", Font.BOLD, 12));

			Total_money_earned_field = new JTextField();
			RoyeltyPanel_Box.add(Total_money_earned_field);
			Total_money_earned_field.setBounds(179, 284, 157, 30);
			Total_money_earned_field.setEditable(false);
			Total_money_earned_field.setFont(new Font("Arail", Font.BOLD, 12));

			redeem_royaltypoints_field = new JTextField();
			RoyeltyPanel_Box.add(redeem_royaltypoints_field);
			redeem_royaltypoints_field.setBounds(179, 327, 157, 30);
			redeem_royaltypoints_field.setFont(new Font("Arail", Font.BOLD, 12));
			redeem_royaltypoints_field.addActionListener(RedeempointActionListener);
			{
				royeltyno_mainfield = new JTextField();
				RoyeltyPanel_Box.add(royeltyno_mainfield);
				royeltyno_mainfield.setBounds(18, 48, 323, 42);
				royeltyno_mainfield.setName("field_royeltyno");
				royeltyno_mainfield.setFont(new Font("Arial", Font.CENTER_BASELINE, 15));
				royeltyno_mainfield.addActionListener(RoyaltyTextListener);
			}
			{
				label_royaltynumber = new JLabel("Enter Loyalty Number (F4) ");
				RoyeltyPanel_Box.add(label_royaltynumber);
				label_royaltynumber.setLayout(null);
				label_royaltynumber.setBounds(20, 7, 331, 36);
				label_royaltynumber.setName("label_royaltynumber");
				label_royaltynumber.setFont(new Font("Arial", Font.BOLD, 15));
			}

			/** End of the royalty panel elements. */

			// Footer image
			label_fotterimage = new JLabel();
			mainPanel.add(label_fotterimage);
			label_fotterimage.setLayout(null);
			label_fotterimage.setBounds(12, 829, 255, 47);
			label_fotterimage.setName("jLabel9");
			label_fotterimage.setText("label_fotterimage");
			{
				ButtonsPanel = new JPanel();
				mainPanel.add(ButtonsPanel);
				ButtonsPanel.setLayout(null);
				ButtonsPanel.setBounds(1082, 6, 346, 292);
				ButtonsPanel.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED));
				ButtonsPanel.setName("ButtonsPanel");
				ButtonsPanel.setBackground(new Color(236, 255, 255));
				{
					button_productlookup = new JButton(new ImageIcon("resources/products_lookup.png"));
					button_productlookup.setName("button_productlookup");
					button_productlookup.setBounds(12, 9, 157, 79);
					// button_productlookup.setFont(new Font("Arial", Font.BOLD, 14));
					// button_productlookup.setBackground(Color.red);
					ButtonsPanel.add(button_productlookup);

				}
				{
					button_salesreturn = new JButton(new ImageIcon("resources/sales_return.png"));
					ButtonsPanel.add(button_salesreturn);
					button_salesreturn.setName("button_salesreturn");
					button_salesreturn.setBounds(185, 7, 153, 79);

				}
				{
					button_foodcoupons = new JButton(new ImageIcon("resources/food_coupons.png"));
					ButtonsPanel.add(button_foodcoupons);
					// button_foodcoupons.setName("button_foodcoupons");
					button_foodcoupons.setBounds(13, 103, 157, 79);

				}
				{
					button_cardpayment = new JButton(new ImageIcon("resources/card_payment.png"));
					ButtonsPanel.add(button_cardpayment);
					// button_cardpayment.setName("button_cardpayment");
					button_cardpayment.setBounds(186, 102, 153, 79);

				}
				{
					button_voidall = new JButton(new ImageIcon("resources/voidall.png"));
					ButtonsPanel.add(button_voidall);
					button_voidall.setBounds(12, 197, 157, 79);
					// button_voidall.setName("button_voidall");

				}
				{
					button_cashtender = new JButton(new ImageIcon("resources/cash_tender.png"));
					ButtonsPanel.add(button_cashtender);
					button_cashtender.setBounds(184, 197, 153, 79);
					button_cashtender.setName("button_cashtender");

				}
			}

			// Hot keys action mapping
			setActionKeyMapping();
			setButtonClickListers();

			// *****************************************************

			// spane.getHorizontalScrollBar().addAdjustmentListener(new
			// MyAction());

			// Application.getInstance().getContext().getResourceMap(getClass()).injectComponents(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void setButtonClickListers() {
		button_cardpayment.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				cardpaymentaction();
			}
		});

		button_cashtender.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				cashtenderaction();
			}
		});

		button_foodcoupons.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				foodcouponsaction();

			}
		});

		button_productlookup.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				productlookupaction();
			}
		});

		button_salesreturn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				salesreturnaction();
			}
		});

		button_voidall.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				voidallaction();

			}
		});

	}

	protected void voidallaction() {
		clearInvoiceTable();
	}

	protected void salesreturnaction() {
		System.out.println("salesReturn action performed.");
		button_salesreturn.requestFocus(true);
		JOptionPane.showMessageDialog(null, "sales rerun action");
	}

	protected void productlookupaction() {
		System.out.println("productLookup action performed.");
		button_productlookup.requestFocus(true);
		new ProductSearchView(InVoiceScreen.this);
	}

	protected void foodcouponsaction() {
		System.out.println("foodCoupons action performed.");
		button_foodcoupons.requestFocus(true);
		JOptionPane.showMessageDialog(null, "food coupons action");
	}

	protected void cashtenderaction() {

		System.out.println("cashTender action performed.");
		JOptionPane.showMessageDialog(null, "Cash tender action");
		button_cashtender.requestFocus(true);

	}

	protected void cardpaymentaction() {
		System.out.println("card Payment action performed.");
		button_cardpayment.requestFocus(true);
		JOptionPane.showMessageDialog(null, "Card payment action");
	}

	private void setActionKeyMapping() {
		ActionMap actionMap = new ActionMapUIResource();
		actionMap.put("action_save", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Save action performed.");
				barcode_field.setFocusable(true);
				barcode_field.requestFocus();
				System.out.println("Number of invoices " + table_invoice.getRowCount());
				if (table_invoice.getRowCount() > 0)

					SwingUtilities.invokeLater(new Runnable() {

						public void run() {
							// Code to save invoice
							System.out.println("----------------------------------");
							System.out.println("preparing invoice data");
							prepareSaveInvoice();
							System.out.println("preparing invoice data completed");

							System.out.println("Starting invoices save");
							int crmid = new InvoiceController().saveInvoice(invoceproduct_list, netprice_list, invoice_totalamount,
										invoice_totalitemsdiscount, invoice_grandamount, royality_hashmap);
							System.out.println("Invoice save completed id: " + crmid);
							System.out.println("------------------------------------------");
							System.out.println();
							System.out.println();

							// print invoice
							System.out.println("Printing invoice receipt");
							InvoicePrintController printcontroller = new InvoicePrintController();
							printcontroller.printInvoice(tabledata, invoice_totalamount, invoice_totalitemsdiscount, invoice_royaltydiscount,
										invoice_grandamount, "INV01");

							clearInvoiceTable();
						}

					});
				else {
					JOptionPane.showMessageDialog(null, "Invoice are empty");
				}

			}
		});
		actionMap.put("action_exit", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Exit action performed.");
			}
		});

		actionMap.put("action_selectqty", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("action_selectqty action performed.");
				int selectedrow = table_invoice.getSelectedRow();
				System.out.println("selected row: " + selectedrow);
				if (selectedrow == -1) {
					if (table_invoice.getRowCount() > 0) {
						JOptionPane.showMessageDialog(null, "No Invoice selected yet.");
						return;
					}
				}

				if (selectedrow != -1) {
					table_invoice.editCellAt(selectedrow, qty_index);
					table_invoice.requestFocus(true);
				} else {
					JOptionPane.showMessageDialog(null, "No Invoice added yet.");
				}

			}
		});

		actionMap.put("action_selectdiscount", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("action_select discount action performed.");
				int selectedrow = table_invoice.getSelectedRow();
				System.out.println("selected row: " + selectedrow);
				if (selectedrow == -1) {
					if (table_invoice.getRowCount() > 0) {
						JOptionPane.showMessageDialog(null, "No Invoice selected yet.");
						return;
					}
				}

				if (selectedrow != -1) {
					table_invoice.editCellAt(selectedrow, discount_index);
					table_invoice.requestFocus(true);
				} else {
					JOptionPane.showMessageDialog(null, "No Invoice added yet.");
				}

			}
		});

		actionMap.put("action_up", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("UP action performed.");
				/*
				 * if (row_selected == table_invoiceModel.getRowCount()) {
				 * table_invoice.clearSelection();
				 * table_invoice.setRowSelectionInterval(--row_selected, 0); } if (row_selected <
				 * table_invoiceModel.getRowCount()) { table_invoice.clearSelection();
				 * table_invoice.setRowSelectionInterval(row_selected, 0); row_selected--; }
				 */
			}
		});

		actionMap.put("action_down", new AbstractAction() {

			private int previous_selectedrow;

			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Down action performed.");
				// table_invoice.setRowSelectionInterval(0, 0);
				table_invoice.editCellAt(0, qty_index);
				table_invoice.requestFocus(true);
				table_invoice.setFocusable(true);

				// if(row_selected != table_invoice.getRowCount()) {
				// if(row_selected == -1) {
				// row_selected = 0;
				// }
				// if (row_selected < table_invoiceModel.getRowCount()) {
				//
				// table_invoice.setRowSelectionInterval(row_selected, 0);
				// previous_selectedrow = row_selected;
				// row_selected++;
				// }
				// }
			}
		});

		actionMap.put("action_delete", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Delete action performed.");
				int selectedrow = table_invoice.getSelectedRow();
				System.out.println("selected row: " + selectedrow);
				if (selectedrow > -1) {

					float itemmrp = Float.parseFloat((String) table_invoiceModel.getValueAt(selectedrow, mrp_index));
					// remove invoice from table and hashmap
					String deleted_barcode = (String) table_invoiceModel.getValueAt(selectedrow, barcode_index);
					products_hashmap.remove(deleted_barcode);
					table_invoiceModel.removeRow(selectedrow);
					int numitems = table_invoice.getRowCount();
					System.out.println("Remaining rows " + numitems);
					lable_numitems.setText(" Items: " + numitems);

					// deduce amount from total, grandtotal, rslabel
					String rsstring = label_rsamount.getText().substring(3);
					System.out.println("rs substring: " + rsstring);
					float rsamount = Float.parseFloat(rsstring);

					float totalamount = Float.parseFloat(totalamount_lable.getText().trim());
					float total = totalamount - itemmrp;

					if ((int) total == 0) {
						totalamount_lable.setText("00.00" + RIGHTOFFSET);
						grandtotal_lable.setText("00.00" + RIGHTOFFSET);
						label_rsamount.setText("Rs.  00.00");

						invoice_royaltydiscount = 0;
						discountamount_lable.setText("00.00" + RIGHTOFFSET);
						clearRoyaltyFields();
						barcode_field.requestFocus(true);
						return;
					}
					totalamount_lable.setText(Util.toDecimalTwo((Math.round(total))) + RIGHTOFFSET);

					float gamount = total - invoice_royaltydiscount;
					grandtotal_lable.setText(Util.toDecimalTwo(Math.round(gamount)) + RIGHTOFFSET);
					label_rsamount.setText("Rs.  " + Util.toDecimalTwo(Math.round(gamount)));
				} else {
					barcode_field.requestFocus(true);
				}
			}
		});

		actionMap.put("barcode_select", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("barcode select action performed.");
				barcode_field.requestFocus(true);
				System.out.println("Current selected row: " + table_invoice.getSelectedRow());

			}
		});

		actionMap.put("royalty_select", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Select royalty action performed.");
				int rows = table_invoice.getRowCount();
				if (rows > 0)
					royeltyno_mainfield.requestFocus(true);
				else
					JOptionPane.showMessageDialog(null, "Invoices are empty");
			}
		});
		actionMap.put("productLookup", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				productlookupaction();

			}
		});
		actionMap.put("cardPayment", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				cardpaymentaction();
			}
		});
		actionMap.put("salesReturn", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				salesreturnaction();

			}
		});
		actionMap.put("foodCoupons", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				foodcouponsaction();

			}
		});

		actionMap.put("voidAll", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				voidallaction();

			}
		});
		actionMap.put("cashTender", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				cashtenderaction();
			}
		});

		InputMap keyMap = new ComponentInputMap(mainPanel);

		keyMap.put(KeyStroke.getKeyStroke("F11"), "cashTender");
		keyMap.put(KeyStroke.getKeyStroke("F10"), "voidAll");
		keyMap.put(KeyStroke.getKeyStroke("F9"), "productLookup");
		keyMap.put(KeyStroke.getKeyStroke("F8"), "foodCoupons");
		keyMap.put(KeyStroke.getKeyStroke("F7"), "salesReturn");
		keyMap.put(KeyStroke.getKeyStroke("F6"), "cardPayment");
		keyMap.put(KeyStroke.getKeyStroke("F4"), "royalty_select");
		keyMap.put(KeyStroke.getKeyStroke("ESCAPE"), "barcode_select");
		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_DOWN, 0), "action_down");
		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_UP, 0), "action_up");
		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_M, java.awt.Event.ALT_MASK), "action_save");
		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_Q, java.awt.Event.CTRL_MASK), "action_exit");
		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_Q, java.awt.Event.ALT_MASK), "action_selectqty");
		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_D, java.awt.Event.ALT_MASK), "action_selectdiscount");

		keyMap.put(KeyStroke.getKeyStroke((char) java.awt.Event.DELETE), "action_delete");

		SwingUtilities.replaceUIActionMap(mainPanel, actionMap);
		SwingUtilities.replaceUIInputMap(mainPanel, JComponent.WHEN_IN_FOCUSED_WINDOW, keyMap);
		barcode_field.requestFocus(true);
	}

	private void formatTableCells(TableColumn column, int width) {
		column.setPreferredWidth(width);
	}

	public class MyAction implements AdjustmentListener {
		public void adjustmentValueChanged(AdjustmentEvent ae) {
			int value = ae.getValue();
			String st = Integer.toString(value);

		}
	}

	/**
	 * {@link ActionListener} for barcode text field.
	 */
	private ActionListener barcode_field_listener = new ActionListener() {

		public void actionPerformed(ActionEvent evt) {
			String barcode = barcode_field.getText().trim();
			barcode_field.setText("");
			if (barcode.length() > 0) {
				addInvoiceTableRow(barcode);
			}

		}
	};

	public void addInvoiceTableRow(String barcode) {
		System.out.println("Entered barcode is " + barcode);
		String modelname = VtigerProducts.class.getSimpleName();
		String col_name = "barcode";
		List<VtigerProducts> products = DBLocalHelper.readRecord(modelname, col_name, barcode);
		if (products.size() == 0) {
			JOptionPane.showMessageDialog(null, "No product available");
		} else {
			// check product quantity database
			VtigerProducts product = products.get(0);
			      boolean acept = validateProduct(product);
			if (acept) {
				int exist_rownum = isProductAlreadyInTable(product, barcode);
				System.out.println("is row exist row number: " + exist_rownum);
				if (exist_rownum == -1) {
					System.out.println("Add products to hashmap with barcode key");
					for (Iterator iterator = products.iterator(); iterator.hasNext();) {
						VtigerProducts vtigerProduct = (VtigerProducts) iterator.next();
						String barcode1 = vtigerProduct.getBarcode();
						products_hashmap.put(barcode1, vtigerProduct);
					}
					addProductTable(products);
				} else {
					updateProductTable(products, exist_rownum);
				}
			}
			else {
				System.out.println("validateProduct failed");
				JOptionPane.showMessageDialog(null, "Sorry, No stock in store");
			}
		}
	}

	private boolean validateProduct(VtigerProducts product) {
		
		int warehouseid= 2;
		String hsql = "From " + VtigerWarehousestoreInventorytransaction.class.getSimpleName() + " WHERE productid = " + product.getProductid()
					+ " AND warehousestore_id = " + warehouseid + " ORDER BY warehousestore_transaction_id DESC LIMIT 1";
		System.out.println("VtigerWarehousestoreInventorytransaction query " + hsql);
		List executeHQuery = DBLocalHelper.executeHQuery(hsql);
		if(executeHQuery.size() > 0)
		{
			VtigerWarehousestoreInventorytransaction WInvTrans = (VtigerWarehousestoreInventorytransaction)	executeHQuery.get(0);
			int openingstock = WInvTrans.getOpeningStockQty();
			if(openingstock > 0) {
				//now check in vtiger_warehouse_stock for store quantity
				return true;
				
			}
			
		}
		
		return false;
	}

	/**
	 * Check product invoice table any existing invoice available.
	 * 
	 * @param product
	 *            - product to check already exist.
	 * @param barcode
	 *            - barcode of already existing invoice.
	 * @return true when invoice already exist otherwise return false.
	 */
	private int isProductAlreadyInTable(VtigerProducts product, String barcode) {

		int exist_rownum = -1;
		int rows_num = table_invoiceModel.getRowCount();
		int barcode_colnum = 1;
		if (rows_num != 0) {
			for (int i = 0; i < rows_num; i++) {
				String row_barcode = (String) table_invoiceModel.getValueAt(i, barcode_index);
				if (row_barcode.equalsIgnoreCase(barcode)) {
					System.out.println("row_barcode: " + row_barcode + " barcode:" + barcode + " exist row number: " + i);
					exist_rownum = i;
					return exist_rownum;
				}
			}
		}
		return exist_rownum;

	}

	/**
	 * Add a new invoice to the product invoice table.
	 * 
	 * @param products
	 *            - Invoice product to add table.
	 */
	private void addProductTable(List<VtigerProducts> products) {

		String rowData[] = calculateInvoiceData(products, "1");
		// add product to table dynamically
		if (rowData.length != 0) {
			table_invoiceModel.addRow(rowData);
			// update lable_numitems with number of invoices
			lable_numitems.setText(" Items:    " + table_invoiceModel.getRowCount());
		}
		updateTotalLabels();

	}

	private void updateProductTable(List<VtigerProducts> products, int rownumber) {
		String prev_qty = (String) table_invoiceModel.getValueAt(rownumber, qty_index);
		int qty = Integer.valueOf(prev_qty);
		qty = qty + 1;
		String rowData[] = calculateInvoiceData(products, String.valueOf(qty));
		if (rowData.length != 0) {
			CELLUPDATE = true;
			// Update the row net amount field & quatity field only
			table_invoiceModel.setValueAt(rowData[qty_index], rownumber, qty_index);
			table_invoiceModel.setValueAt(rowData[mrp_index], rownumber, mrp_index);

		}
		updateTotalLabels();
		CELLUPDATE = false;
	}

	/**
	 * 
	 * @param products
	 * @param quatity
	 * @return
	 */
	private String[] calculateInvoiceData(List<VtigerProducts> products, String quatity) {
		String rowData[] = null;
		for (Iterator iterator = products.iterator(); iterator.hasNext();) {
			VtigerProducts vtigerProduct = (VtigerProducts) iterator.next();
			String[] invoice = { vtigerProduct.getBarcode(), vtigerProduct.getProductname(), vtigerProduct.getUnitPrice(),
					vtigerProduct.getDiscount(), vtigerProduct.getVat() };
			rowData = calculateInvoiceData(invoice, quatity);

		}
		return rowData;

	}

	private String[] calculateInvoiceData(String[] invoice, String quantity) {
		String rowData[] = new String[table_invoiceModel.getColumnCount()];
		// rowData[0] = String.valueOf(table_invoiceModel.getRowCount() + 1);
		rowData[barcode_index] = invoice[0]; // vtigerProducts.getBarcode();
		rowData[productname_index] = invoice[1]; // vtigerProducts.getProductname();
		rowData[unitprice_index] = invoice[2]; // vtigerProducts.getUnitPrice();
		rowData[qty_index] = quantity;
		rowData[discount_index] = invoice[3]; // vtigerProducts.getDiscount();
		rowData[vat_index] = invoice[4]; // vtigerProducts.getVat();
		previous_quantity = Integer.parseInt(quantity);

		float unit_price = Float.parseFloat(rowData[unitprice_index]);
		int qty = Integer.parseInt(rowData[qty_index]);
		float discount = Float.parseFloat(rowData[discount_index]);
		float vat_per = Float.parseFloat(rowData[vat_index]);

		// calc total unit price for quantity
		unit_price = unit_price * qty;
		rowData[unitprice_index] = Util.toDecimalTwo(unit_price);

		// calculate discount amount
		float discount_amount = 0;
		float discount_unitprice = unit_price;
		if (discount != 0.0) {
			discount_amount = Util.calculate_discount(discount_unitprice, discount);
			discount_unitprice = discount_unitprice - discount_amount;

		}

		// calc vat percentage amount
		float vat_amount = Util.calculate_discount(discount_unitprice, vat_per);
		// calc grand total amount
		float grand_total = discount_unitprice + vat_amount;
		rowData[mrp_index] = Util.toDecimalTwo(grand_total);
		/****************************************
		 * // update total amount label float total_amount_all = unit_price; float ptotal =
		 * Float.parseFloat(totalamount_lable.getText());
		 * 
		 * String current_total = String.valueOf(Util.Round( (total_amount_all + ptotal), 2));
		 * totalamount_lable.setText(current_total);
		 * 
		 * // update discount amount label float total_discount_all =
		 * Float.parseFloat(discountamount_lable .getText()) + discount_amount;
		 * discountamount_lable.setText(String.valueOf(total_discount_all));
		 * 
		 * // update grand total amount label float grandtotal_all =
		 * Float.parseFloat(grandtotal_lable.getText()) + grand_total;
		 * 
		 * grandtotal_lable.setText(String.valueOf(grandtotal_all));
		 ******************************************/
		return rowData;
	}

	private void addTableListener() {
		table_invoiceModel.addTableModelListener(new TableModelListener() {
			/*
			 * (non-Javadoc)
			 * @see javax.swing.event.TableModelListener#tableChanged(javax.swing
			 * .event.TableModelEvent)
			 */
			@Override
			public void tableChanged(TableModelEvent tme) {
				if (tme.getType() == TableModelEvent.UPDATE) {
					if (tme.getColumn() == qty_index && !CELLUPDATE) {
						System.out.println("Quantity update");
						String quatity = (String) table_invoiceModel.getValueAt(tme.getFirstRow(), tme.getColumn());
						System.out.println("Quatity updated to " + quatity);

						// read updated table row
						int columncount = table_invoiceModel.getColumnCount();
						int updatedrow = tme.getFirstRow();
						String product[] = new String[columncount];
						// vtigerProducts.getBarcode();
						product[0] = (String) table_invoiceModel.getValueAt(updatedrow, barcode_index);
						// vtigerProducts.getProductname();
						product[1] = (String) table_invoiceModel.getValueAt(updatedrow, productname_index);
						// vtigerProducts.getUnitPrice();
						product[2] = (String) table_invoiceModel.getValueAt(updatedrow, unitprice_index);
						// vtigerProducts.getDiscount();
						product[3] = (String) table_invoiceModel.getValueAt(updatedrow, discount_index);
						// vtigerProducts.getVat();
						product[4] = (String) table_invoiceModel.getValueAt(updatedrow, vat_index);

						// Update row with invoice data
						String rowData[] = calculateInvoiceData(product, String.valueOf(quatity));
						if (rowData.length != 0) {
							CELLUPDATE = true;

							// Update the row net amount field & qty field
							// only
							table_invoiceModel.setValueAt(rowData[qty_index], updatedrow, qty_index);
							table_invoiceModel.setValueAt(rowData[mrp_index], updatedrow, mrp_index);

						}
						updateTotalLabels();
						CELLUPDATE = false;

					}

					if (tme.getColumn() == discount_index && !CELLUPDATE) {
						System.out.println("Discount update");
						String discount = (String) table_invoiceModel.getValueAt(tme.getFirstRow(), tme.getColumn());
						System.out.println("Discount updated to " + discount);

						// read updated table row
						int columncount = table_invoiceModel.getColumnCount();
						int updatedrow = tme.getFirstRow();

						// calculate MRP = MRP - (MRP%discount)

						float MRP = Float.parseFloat((String) table_invoiceModel.getValueAt(updatedrow, mrp_index));
						float discount_amount = Util.calculate_discount(MRP, Float.parseFloat(discount));
						if (discount_amount > 0) {
							CELLUPDATE = true;
							MRP = Util.Round((MRP - discount_amount), 2);
							table_invoiceModel.setValueAt(String.valueOf(MRP), updatedrow, mrp_index);
						}
						updateTotalLabels();
						CELLUPDATE = false;
					}
				}
			}
		});
	}

	private void updateTotalLabels() {
		int rows = table_invoiceModel.getRowCount();
		int cols = table_invoiceModel.getColumnCount();
		float totalamount = 0;
		invoice_totalitemsdiscount = 0;
		float totalgrand = 0;
		for (int i = 0; i < rows; i++) {
			// total amount
			float amount = Float.parseFloat((String) table_invoiceModel.getValueAt(i, unitprice_index))
						* Float.parseFloat((String) table_invoiceModel.getValueAt(i, qty_index));
			totalamount += amount;

			// total discount amount
			float discount = Float.parseFloat((String) table_invoiceModel.getValueAt(i, discount_index));
			if (discount != 0) {
				discount = Util.calculate_discount(totalamount, discount);
				invoice_totalitemsdiscount += discount;
			}

			// grand total amount
			float gamount = Float.parseFloat((String) table_invoiceModel.getValueAt(i, mrp_index));
			totalgrand += gamount;

		}

		// update amounts to labels
		totalgrand = Util.Round(totalgrand, 2);
		totalamount_lable.setText(Util.toDecimalTwo(totalgrand) + RIGHTOFFSET);
		// update royalty discount label
		invoice_royaltydiscount = Util.Round(invoice_royaltydiscount, 2);
		discountamount_lable.setText(Util.toDecimalTwo(invoice_royaltydiscount) + RIGHTOFFSET);
		// update grand total label
		int grandtot = Math.round(totalgrand - invoice_royaltydiscount);
		grandtotal_lable.setText(Util.toDecimalTwo(grandtot) + RIGHTOFFSET);
		// update label_rsamount
		label_rsamount.setText("Rs.  " + Util.toDecimalTwo(grandtot));

	}

	/**
	 * Prepare invoices for {@link InvoiceController} to store in local database. First it read all
	 * invoices from invoice table into table data multi-dimensional array. Once invoices read
	 * complete next read corresponding productid from product_hashmap {@link HashMap}. Finally
	 * stores all invoices into invoiceproduct_list instance variable.
	 */
	private void prepareSaveInvoice() {
		int rows = table_invoiceModel.getRowCount();
		int cols = table_invoiceModel.getColumnCount();
		tabledata = new String[rows][cols];
		invoceproduct_list = new ArrayList<InvoiceProduct>();
		netprice_list = new String[rows];
		System.out.println("Invoice table data");

		// read invoice table data to array
		for (int i = 0; i < rows; i++) {
			System.out.println();
			for (int j = 0; j < cols; j++) {
				tabledata[i][j] = (String) table_invoiceModel.getValueAt(i, j);
				System.out.print(tabledata[i][j] + RIGHTOFFSET);
			}
		}
		System.out.println();

		// Prepare invoice products list
		System.out.println("-----------------------------------");
		System.out.println("products hash data");
		for (int i = 0; i < products_hashmap.size(); i++) {
			VtigerProducts product = products_hashmap.get(tabledata[i][barcode_index]);
			InvoiceProduct inoviceproduct = new InvoiceProduct();

			inoviceproduct.setProductid(product.getProductid());
			inoviceproduct.setBcode(product.getBarcode());
			inoviceproduct.setProductname(product.getProductname());
			inoviceproduct.setMrp(product.getUnitPrice());
			String q = (String) table_invoiceModel.getValueAt(i, qty_index);
			inoviceproduct.setQty(q);
			inoviceproduct.setVat(product.getVat());
			netprice_list[i] = (String) table_invoiceModel.getValueAt(i, mrp_index);
			invoceproduct_list.add(i, inoviceproduct);
			System.out.println("invoice: " + inoviceproduct + " netprice:" + netprice_list[i]);

		}

		// Prepare invoices total data
		invoice_totalamount = Float.parseFloat(totalamount_lable.getText().trim());
		invoice_grandamount = Float.parseFloat(grandtotal_lable.getText().trim());

		/* read royalty fields information */
		royality_hashmap = new HashMap<String, String>();
		String royalty_number = royelty_update_field.getText().trim();

		if (royalty_number != null && !royalty_number.isEmpty()) {
			System.out.println("Entered royality number: " + royalty_number);
			royality_hashmap.put("royalityno", royalty_number);
			royality_hashmap.put("customername", this.textfield_customername.getText().trim());
			royality_hashmap.put("customermobileno", this.textfield_customer_mobileno.getText().trim());
			royality_hashmap.put("redeempoints", this.redeem_royaltypoints_field.getText().trim());
		}

	}

	private static final class JGradientButton extends JButton {
		private JGradientButton() {
			super("Gradient Button");
			setContentAreaFilled(false);
			setFocusPainted(true); // used for demonstration
		}

		@Override
		protected void paintComponent(Graphics g) {
			Graphics2D g2 = (Graphics2D) g.create();
			g2.setPaint((Paint) new GradientPaint(new Point(0, 0), Color.WHITE, new Point(0, getHeight()), Color.PINK.darker()));
			g2.fillRect(0, 0, getWidth(), getHeight());
			g2.dispose();

			super.paintComponent(g);
		}

		public static final JGradientButton newInstance() {
			return new JGradientButton();
		}
	}

	private class SelectionListener implements ListSelectionListener {

		@Override
		public void valueChanged(ListSelectionEvent e) {
			String selectedData = null;

			int[] selectedRow = table_invoice.getSelectedRows();
			int[] selectedColumns = table_invoice.getSelectedColumns();

			for (int i = 0; i < selectedRow.length; i++) {
				for (int j = 0; j < selectedColumns.length; j++) {
					selectedData = (String) table_invoice.getValueAt(selectedRow[i], selectedColumns[j]);
				}
			}
			System.out.println("Selected: " + selectedData);
		}

	}

	/**
	 * Clear all the invoices currently placed in table.
	 */
	private void clearInvoiceTable() {
		System.out.println("voidAll action performed.");
		button_voidall.requestFocus(true);

		int rows = table_invoiceModel.getRowCount();
		System.out.println("deleting " + rows + " rows.");
		DefaultTableModel dm = (DefaultTableModel) table_invoice.getModel();
		for (int i = dm.getRowCount() - 1; i >= 0; i--) {
			System.out.println("deleting row " + i);
			dm.removeRow(i);
		}

		products_hashmap.clear();
		// clear labels
		label_rsamount.setText("Rs.  0");
		lable_numitems.setText(" Items:    0");
		totalamount_lable.setText("00.00" + RIGHTOFFSET);
		discountamount_lable.setText("00.00" + RIGHTOFFSET);
		grandtotal_lable.setText("00.00" + RIGHTOFFSET);
		// clear royalty fields
		clearRoyaltyFields();

	}

	private void clearRoyaltyFields() {
		royelty_update_field.setText("");
		royeltyno_mainfield.setText("");
		textfield_customername.setText("");
		textfield_customer_mobileno.setText("");
		total_royaltypoints_field.setText("");
		Total_money_earned_field.setText("");
		redeem_royaltypoints_field.setText("");

	}

	/**
	 * This is royality main text field action implementation. Once royaluty number enter action
	 * listen read royality contactid form vtiger_contactroyaliyt and contactid corresponding
	 * details are fetch from vtiger_contactdetails.
	 */
	private ActionListener RoyaltyTextListener = new ActionListener() {

		@Override
		public void actionPerformed(ActionEvent e) {
			String royaltynumber = royeltyno_mainfield.getText().trim();
			royeltyno_mainfield.setText("");
			textfield_customername.setText("");
			textfield_customer_mobileno.setText("");
			redeem_royaltypoints_field.setEditable(true);
			if (royaltynumber.length() > 0) {
				System.out.println("Entered royalty number is " + royaltynumber);
				royelty_update_field.setText(royaltynumber);
				RoyalityController rcontrollController = new RoyalityController();
				VtigerContactroyality contactroyality = rcontrollController.readContactRoyality(royaltynumber);
				if (contactroyality == null) {
					System.out.println("Royality number not exist");
					textfield_customername.setEditable(true);
					textfield_customer_mobileno.setEditable(true);
					redeem_royaltypoints_field.setEditable(false);
					redeem_royaltypoints_field.setText(" ");
					Total_money_earned_field.setText(" ");
					discountamount_lable.setText("0");
					total_royaltypoints_field.setText("");
					textfield_customer_mobileno.requestFocus(true);
				} else {
					int contactid = contactroyality.getContactid();
					System.out.println("Royality contact exist id - " + contactid);
					VtigerContactdetails contact = rcontrollController.readContactDetails(contactid);
					if (contact != null) {
						textfield_customername.setText(contact.getFirstname() + contact.getLastname());
						textfield_customername.setEditable(false);
						textfield_customer_mobileno.setText(contact.getMobile());
						textfield_customer_mobileno.setEditable(false);
						total_royaltypoints_field.setText(String.valueOf(contactroyality.getRoyalitycount()));
						redeem_royaltypoints_field.requestFocus(true);

					} else {
						System.out.println("Contact id " + contactid + " details not found in database.");
					}

				}
			}

		}
	};

	private ActionListener RedeempointActionListener = new ActionListener() {

		@Override
		public void actionPerformed(ActionEvent e) {
			String redeempoints_data = redeem_royaltypoints_field.getText().trim();
			System.out.println("redeem points: " + redeempoints_data);
			String H_RoyaltyUpdate = "From " + VtigerRoyality.class.getSimpleName() + " WHERE deleted=0";
			System.out.println("query: " + H_RoyaltyUpdate);
			List<VtigerRoyality> vtigerroyalitys = DBLocalHelper.executeHQuery(H_RoyaltyUpdate);
			System.out.println("Number of royaltys: " + vtigerroyalitys.size());
			VtigerRoyality vtigerroyality = vtigerroyalitys.get(0);
			float royalityamount = Float.parseFloat(vtigerroyality.getRoyalityamount());
			int royaltycount = vtigerroyality.getRoyalityCount();
			int redeempoints = Integer.parseInt(redeempoints_data);
			int royaltyamount = Math.round((float) (redeempoints / royaltycount) * royalityamount);
			System.out.println("royaltyamount: " + royaltyamount);
			float totalamount = Float.parseFloat(totalamount_lable.getText().trim());
			float grandtotal = totalamount - royaltyamount;

			if (royaltyamount > totalamount) {
				System.out.println("Royalty amount exceding total amount");
				JOptionPane.showMessageDialog(null, "Royalty amount exceding total amount");
			} else {
				invoice_royaltydiscount = royaltyamount;
				discountamount_lable.setText(Util.toDecimalTwo(royaltyamount) + RIGHTOFFSET);
				grandtotal_lable.setText(Util.toDecimalTwo(Math.round(grandtotal)) + RIGHTOFFSET);
				label_rsamount.setText("Rs  :" + Util.toDecimalTwo(Math.round(grandtotal)));
				Total_money_earned_field.setText(Util.toDecimalTwo(royaltyamount) + RIGHTOFFSET);
			}
		}
	};

}
