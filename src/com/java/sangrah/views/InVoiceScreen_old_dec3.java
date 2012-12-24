package com.java.sangrah.views;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.AdjustmentEvent;
import java.awt.event.AdjustmentListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.ActionMap;
import javax.swing.BorderFactory;
import javax.swing.ComponentInputMap;
import javax.swing.InputMap;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.border.BevelBorder;
import javax.swing.border.MatteBorder;
import javax.swing.border.SoftBevelBorder;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.plaf.ActionMapUIResource;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumn;

import org.jdesktop.application.Application;

import com.java.sangrah.controllers.DBLocalHelper;
import com.java.sangrah.controllers.InvoiceController;
import com.java.sangrah.models.InvoiceProduct;
import com.java.sangrah.models.VtigerProducts;
import com.java.sangrah.utils.Util;

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
public class InVoiceScreen_old_dec3 extends javax.swing.JPanel {
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
	private JTextField royeltyno_field;
	private JPanel RoyeltyPanel_Box;
	private JPanel ItemsPanel_Box;
	private JLabel label_royaltynumber;
	private JButton searchproduct_button;
	private JSeparator jSeparator1;
	private JTextField barcode_field;
	private JLabel label_royaltyheadder;
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
	private JButton Cancle_Button;
	private JButton Save_button;
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
	private JLabel label_royaltypoint_information;
	private int cell_width[] = { 5, 20, 200, 20, 20, 20, 20, 20 };
	private DefaultTableModel table_invoiceModel;
	private int previous_quantity = 0;

	public static String[] producttable_headder = { "S NO.", "Bar Code", "Product Name",
			"Unit Price", "Qty", "Discount(%)", "VAT(%)", "Net Price" };
	private final int sno_index = 0;
	private final int barcode_index = 1;
	private final int productname_index = 2;
	private final int unitprice_index = 3;
	private final int qty_index = 4;
	private final int discount_index = 5;
	private final int vat_index = 6;
	private final int netprice_index = 7;

	private boolean CELLUPDATE = false;

	private HashMap<String, VtigerProducts> products_hashmap;
	List<InvoiceProduct> invoceproduct_list = null;
	private String[] netprice_list = null;
	private float invoice_totalamount = 0;
	private float invoice_totaldiscount = 0;
	private float invoice_grandamount = 0;

	/**
	 * Auto-generated main method to display this JInternalFrame inside a new
	 * JFrame.
	 */
	public static void main(String[] args) {
		// jdp.setPreferredSize(inst.getPreferredSize());
		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
		} catch (Exception e) {
			e.printStackTrace();
		}
		InVoiceScreen_old_dec3 screen = new InVoiceScreen_old_dec3();
		JFrame frame = new JFrame();
		frame.add(screen);
		frame.show();

	}

	public InVoiceScreen_old_dec3() {
		super();
		products_hashmap = new HashMap<String, VtigerProducts>();
		initGUI();
		setVisible(true);
		show();
	}

	private void initGUI() {
		try {
			this.setPreferredSize(new java.awt.Dimension(1289, 691));
			this.setBounds(0, 0, 1289, 691);
			setVisible(true);
			// this.setTitle("InVoice Screen");
			this.setLayout(null);

			mainPanel = new JPanel();
			barcode_panel = new JPanel();
			ItemsPanel_Box = new JPanel();
			tableheaderpanel = new JPanel();
			RoyeltyPanel_Box = new JPanel();

			this.add(mainPanel);
			mainPanel.setLayout(null);
			mainPanel.setBounds(10, 0, 1275, 668);
			mainPanel.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
			mainPanel.setName("mainPanel");

			/** Initialize barcode panel layout. */

			// initialize shortcut key labels
			label_shortcutkeys = new JLabel();
			mainPanel.add(label_shortcutkeys);
			label_shortcutkeys.setLayout(null);
			label_shortcutkeys.setBounds(7, 9, 129, 14);
			label_shortcutkeys.setName("label_shortcutkeys");
			label_shortcutkeys.setText("Shortcut Keys >>");

			label_barcodefocus = new JLabel();
			mainPanel.add(label_barcodefocus);
			label_barcodefocus.setLayout(null);
			label_barcodefocus.setBounds(146, 9, 148, 14);
			label_barcodefocus.setName("label_barcodefocus");
			label_barcodefocus.setText("[Barcode Focus :: ALT + B]");

			label_saveinvoice = new JLabel();
			mainPanel.add(label_saveinvoice);
			label_saveinvoice.setLayout(null);
			label_saveinvoice.setBounds(320, 9, 146, 14);
			label_saveinvoice.setName("label_saveinvoice");
			label_saveinvoice.setText("[Save InVoice :: Alt + M]");

			label_goup = new JLabel();
			mainPanel.add(label_goup);
			label_goup.setLayout(null);
			label_goup.setBounds(483, 9, 150, 14);
			label_goup.setName("label_goup");
			label_goup.setText("[Go Up :: Alt + Arrow Up]");

			label_godown = new JLabel();
			mainPanel.add(label_godown);
			label_godown.setLayout(null);
			label_godown.setBounds(652, 9, 170, 14);
			label_godown.setName("label_godown");
			label_godown.setText("[Go Down :: Alt + Arrow Down]");

			label_deleteitem = new JLabel();
			mainPanel.add(label_deleteitem);
			label_deleteitem.setLayout(null);
			label_deleteitem.setBounds(838, 9, 166, 14);
			label_deleteitem.setName("label_deleteitem");
			label_deleteitem.setText("[Delete item :: Ctrl + D]");

			label_selectquantity = new JLabel();
			mainPanel.add(label_selectquantity);
			label_selectquantity.setBounds(1010, 9, 219, 14);
			label_selectquantity.setName("label_selectquantity");
			label_selectquantity.setText("[Select Quantity :: Alt + Q]");

			// initialize bar code panel elements
			mainPanel.add(barcode_panel);
			barcode_panel.setLayout(null);
			barcode_panel.setBounds(2, 41, 1271, 58);
			barcode_panel.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));

			// initialize bar code textfield
			barcode_field = new JTextField();
			barcode_panel.add(barcode_field, new GridBagConstraints(1, 1, 1, 1, 0.0, 0.0,
						GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0),
						0, 0));
			barcode_field.setBounds(13, 14, 358, 35);
			barcode_field.setName("barcode_field");
			barcode_field.setFont(new Font("Arail", Font.BOLD, 15));
			barcode_field.addActionListener(barcode_field_listener);

			// initialize search code button

			searchproduct_button = new JButton();
			barcode_panel.add(searchproduct_button);
			searchproduct_button.setLayout(null);
			searchproduct_button.setBounds(479, 14, 232, 31);
			searchproduct_button.setOpaque(true);
			searchproduct_button.setName("searchproduct_button");
			searchproduct_button.setText("Search Products");
			searchproduct_button.setFont(new Font("Arial", Font.CENTER_BASELINE, 15));
			searchproduct_button.setForeground(Color.blue);
			searchproduct_button.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					
				}
			});

			jSeparator1 = new JSeparator(SwingConstants.VERTICAL);
			barcode_panel.add(jSeparator1);
			jSeparator1.setLayout(null);
			jSeparator1.setBounds(800, 12, 10, 38);

			// initialize royalty number label elements
			label_royaltynumber = new JLabel();
			barcode_panel.add(label_royaltynumber);
			label_royaltynumber.setLayout(null);
			label_royaltynumber.setBounds(854, 8, 122, 36);
			label_royaltynumber.setName("label_royaltynumber");
			label_royaltynumber.setText("Royalty No.");
			label_royaltynumber.setFont(new Font("Arial", Font.BOLD, 15));

			// initialize royalty number text field
			royeltyno_field = new JTextField();
			barcode_panel.add(royeltyno_field);
			royeltyno_field.setBounds(997, 11, 247, 33);
			royeltyno_field.setName("royeltyno_field");
			royeltyno_field.setFont(new Font("Arial", Font.CENTER_BASELINE, 15));

			/** End of the barcode panel initialization. */

			/** Initialize ItemsPanel elements. */

			// initialize items table labels
			mainPanel.add(ItemsPanel_Box);
			ItemsPanel_Box.setLayout(null);
			ItemsPanel_Box.setBounds(2, 120, 944, 440);
			ItemsPanel_Box.setBorder(BorderFactory.createEtchedBorder(new java.awt.Color(255, 255,
						128), null));
			ItemsPanel_Box.setName("ItemsPanel_Box");

			/** Initialize table headder panle elements */
			table_invoiceModel = new DefaultTableModel(new String[][] {}, producttable_headder);

			table_invoice = new JTable(table_invoiceModel) {
				// Returning the Class of each column will allow different
				// renderers to be used based on Class

				public Class getColumnClass(int column) {
					return getValueAt(0, column).getClass();
				}

				public Component prepareRenderer(TableCellRenderer renderer, int row, int column) {
					Component c = super.prepareRenderer(renderer, row, column);
					JComponent jc = (JComponent) c;

					// Color row based on a cell value
					// Alternate row color

					if (!isRowSelected(row))
						c.setBackground(row % 2 == 0 ? getBackground() : Color.BLACK);
					else
						jc.setBorder(new MatteBorder(1, 0, 1, 0, Color.BLUE));
					// Use bold font on selected row
					return c;
				}
			};
			table_invoice.setLayout(null);
			table_invoice.setBounds(2, 49, 940, 300);
			table_invoice.setBackground(Color.BLACK);
			table_invoice.setFont(new Font("Arail", Font.CENTER_BASELINE, 12));
			table_invoice.setForeground(Color.white);
			table_invoice.setOpaque(true);
			table_invoice
						.setBorder(new SoftBevelBorder(BevelBorder.LOWERED, null, null, null, null));
			// adding cell value change listener
			addTableListener();

			// make table formatting
			for (int i = 0; i < table_invoiceModel.getColumnCount(); i++) {
				formatTableCells(table_invoice.getColumnModel().getColumn(i), cell_width[i]);
			}

			JScrollPane scrollpane = new JScrollPane(table_invoice);
			scrollpane.setBounds(2, 8, 940, 290);
			tableheaderpanel.setLayout(null);
			tableheaderpanel.setBounds(2, 8, 940, 300);
			tableheaderpanel.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED));
			tableheaderpanel.setName("tableheaderpanel");
			tableheaderpanel.add(scrollpane);
			ItemsPanel_Box.add(tableheaderpanel);
			/** End of the table headder panel elements. */

			label_totalamount = new JLabel("Total: ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(label_totalamount);
			label_totalamount.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null,
						new java.awt.Color(192, 192, 192)));
			label_totalamount.setLayout(null);
			label_totalamount.setName("label_totalamount");
			label_totalamount.setVerticalAlignment(SwingConstants.CENTER);
			label_totalamount.setBounds(2, 303, 702, 35);

			label_discount = new JLabel("(-) Discount: ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(label_discount);
			label_discount.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null,
						new java.awt.Color(192, 192, 192)));
			label_discount.setLayout(null);
			label_discount.setName("label_discount");
			label_discount.setVerticalAlignment(SwingConstants.CENTER);
			label_discount.setBounds(2, 338, 702, 33);

			label_grandtotal = new JLabel("Grand Total: ", SwingConstants.RIGHT);
			ItemsPanel_Box.add(label_grandtotal);
			label_grandtotal.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null,
						new java.awt.Color(192, 192, 192)));
			label_grandtotal.setLayout(null);
			label_grandtotal.setName("label_grandtotal");
			label_grandtotal.setVerticalAlignment(SwingConstants.CENTER);
			label_grandtotal.setBounds(2, 371, 702, 33);

			totalamount_lable = new JLabel("0", SwingConstants.CENTER);
			ItemsPanel_Box.add(totalamount_lable);
			totalamount_lable.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null,
						new java.awt.Color(192, 192, 192)));
			totalamount_lable.setLayout(null);
			totalamount_lable.setVerticalAlignment(SwingConstants.CENTER);
			totalamount_lable.setBounds(704, 304, 233, 35);
			totalamount_lable.setName("totalamount_lable");

			discountamount_lable = new JLabel("0", SwingConstants.CENTER);
			ItemsPanel_Box.add(discountamount_lable);
			discountamount_lable.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED,
						null, new java.awt.Color(192, 192, 192)));
			discountamount_lable.setLayout(null);
			discountamount_lable.setVerticalAlignment(SwingConstants.CENTER);
			discountamount_lable.setBounds(704, 337, 233, 35);

			grandtotal_lable = new JLabel("0", SwingConstants.CENTER);
			ItemsPanel_Box.add(grandtotal_lable);
			grandtotal_lable.setBorder(BorderFactory.createEtchedBorder(BevelBorder.RAISED, null,
						new java.awt.Color(192, 192, 192)));
			grandtotal_lable.setLayout(null);
			discountamount_lable.setVerticalAlignment(SwingConstants.CENTER);

			grandtotal_lable.setBounds(704, 370, 233, 35);
			grandtotal_lable.setName("grandtotal_lable");

			Save_button = new JButton();
			ItemsPanel_Box.add(Save_button);
			Save_button.setLayout(null);
			Save_button.setBounds(379, 410, 81, 23);
			Save_button.setName("Save_button");
			Save_button.setText("Save");
			Save_button.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0));

			Cancle_Button = new JButton();
			ItemsPanel_Box.add(Cancle_Button);
			Cancle_Button.setLayout(null);
			Cancle_Button.setBounds(486, 410, 85, 23);
			Cancle_Button.setName("Cancle_Button");
			Cancle_Button.setText("cancle");

			/** End of the Items panel elements initialization. */

			/** Initialize Royalty panel elements. */

			mainPanel.add(RoyeltyPanel_Box);
			RoyeltyPanel_Box.setLayout(null);
			RoyeltyPanel_Box.setBounds(952, 105, 321, 380);
			RoyeltyPanel_Box.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
			RoyeltyPanel_Box.setLayout(null);

			// Initialize royalty panel headder
			label_royaltyheadder = new JLabel();
			RoyeltyPanel_Box.add(label_royaltyheadder);
			label_royaltyheadder.setLayout(null);
			label_royaltyheadder.setBounds(2, 7, 317, 30);
			label_royaltyheadder.setName("label_royaltyheadder");
			label_royaltyheadder.setText("Royalty Information");

			// initilize royalty no label
			label_royaltyno = new JLabel();
			label_royaltyno.setLayout(null);
			label_royaltyno.setBounds(2, 55, 124, 17);
			label_royaltyno.setName("label_royaltyno");
			RoyeltyPanel_Box.add(label_royaltyno);
			label_royaltyno.setText("Royalty No.");

			royelty_update_field = new JTextField();
			RoyeltyPanel_Box.add(royelty_update_field);
			royelty_update_field.setBounds(146, 53, 153, 20);
			royelty_update_field.setName("royelty_update_field");

			label_customer_mobileno = new JLabel();
			RoyeltyPanel_Box.add(label_customer_mobileno);
			label_customer_mobileno.setLayout(null);
			label_customer_mobileno.setBounds(2, 83, 124, 14);
			label_customer_mobileno.setName("label_customer_mobileno");
			label_customer_mobileno.setText("Customer Mobile No.");

			textfield_customer_mobileno = new JTextField();
			RoyeltyPanel_Box.add(textfield_customer_mobileno);
			textfield_customer_mobileno.setBounds(146, 80, 153, 20);
			textfield_customer_mobileno.setName("textfield_customer_mobileno");

			label_customername = new JLabel();
			RoyeltyPanel_Box.add(label_customername);
			label_customername.setLayout(null);
			label_customername.setBounds(2, 117, 124, 14);
			label_customername.setName("label_customername");
			label_customername.setText("Customer Name");

			textfield_customername = new JTextField();
			RoyeltyPanel_Box.add(textfield_customername);
			textfield_customername.setBounds(146, 114, 153, 20);

			label_royaltypoint_information = new JLabel();
			RoyeltyPanel_Box.add(label_royaltypoint_information);
			label_royaltypoint_information.setLayout(null);
			label_royaltypoint_information.setBounds(2, 169, 317, 31);
			label_royaltypoint_information.setName("jLabel25");
			label_royaltypoint_information.setText("Royalty points information");

			label_royalpoints = new JLabel();
			RoyeltyPanel_Box.add(label_royalpoints);
			label_royalpoints.setLayout(null);
			label_royalpoints.setBounds(2, 220, 124, 22);
			label_royalpoints.setName("label_royalpoints");
			label_royalpoints.setText("Total Royal Points");

			label_totalmoney_earned = new JLabel();
			RoyeltyPanel_Box.add(label_totalmoney_earned);
			label_totalmoney_earned.setLayout(null);
			label_totalmoney_earned.setBounds(2, 248, 124, 20);
			label_totalmoney_earned.setName("label_totalmoney_earned");
			label_totalmoney_earned.setText("Total money earned");

			label_redeem_royalpoints = new JLabel();
			RoyeltyPanel_Box.add(label_redeem_royalpoints);
			label_redeem_royalpoints.setLayout(null);
			label_redeem_royalpoints.setBounds(2, 279, 134, 14);
			label_redeem_royalpoints.setName("label_redeem_royalpoints");
			label_redeem_royalpoints.setText("Redeem Royalty Points");

			total_royaltypoints_field = new JTextField();
			RoyeltyPanel_Box.add(total_royaltypoints_field);
			total_royaltypoints_field.setBounds(146, 221, 153, 20);

			Total_money_earned_field = new JTextField();
			RoyeltyPanel_Box.add(Total_money_earned_field);
			Total_money_earned_field.setBounds(146, 252, 153, 20);

			redeem_royaltypoints_field = new JTextField();
			RoyeltyPanel_Box.add(redeem_royaltypoints_field);
			redeem_royaltypoints_field.setBounds(146, 283, 153, 20);

			/** End of the royalty panel elements. */

			// Footer image
			label_fotterimage = new JLabel();
			mainPanel.add(label_fotterimage);
			label_fotterimage.setLayout(null);
			label_fotterimage.setBounds(14, 557, 255, 97);
			label_fotterimage.setName("jLabel9");
			label_fotterimage.setText("label_fotterimage");

			// Hot keys action mapping
			setActionKeyMapping();

			// *****************************************************

			// spane.getHorizontalScrollBar().addAdjustmentListener(new
			// MyAction());

			Application.getInstance().getContext().getResourceMap(getClass())
						.injectComponents(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void setActionKeyMapping() {
		ActionMap actionMap = new ActionMapUIResource();
		actionMap.put("action_save", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Save action performed.");
				barcode_field.setFocusable(true);
				barcode_field.requestFocus();
				SwingUtilities.invokeLater(new Runnable() {

					public void run() {
						// Code to save invoice
						System.out.println("----------------------------------");
						System.out.println("preparing invoice data");
						prepareSaveInvoice();
						System.out.println("preparing invoice data completed");
						System.out.println("Starting invoices save");
						int crmid = new InvoiceController().saveInvoice(invoceproduct_list,
									netprice_list, invoice_totalamount, invoice_totaldiscount,
									invoice_grandamount, null);
						System.out.println("Invoice save completed id: " + crmid);
						System.out.println("------------------------------------------");
						System.out.println();
						System.out.println();
					}

				});
			}
		});
		actionMap.put("action_exit", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Exit action performed.");
			}
		});

		actionMap.put("action_up", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("UP action performed.");
			}
		});

		actionMap.put("action_down", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Down action performed.");
			}
		});

		actionMap.put("action_delete", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Delete action performed.");
			}
		});

		actionMap.put("action_select", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Select action performed.");
			}
		});

		actionMap.put("escape_action", new AbstractAction() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Select escape performed.");
			}
		});

		InputMap keyMap = new ComponentInputMap(mainPanel);
		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_M, java.awt.Event.ALT_MASK),
					"action_save");
		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_Q, java.awt.Event.CTRL_MASK),
					"action_exit");

		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_UP, java.awt.Event.ALT_MASK),
					"action_up");

		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_DOWN, java.awt.Event.ALT_MASK),
					"action_down");

		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_D, java.awt.Event.CTRL_MASK),
					"action_delete");

		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_Q, java.awt.Event.ALT_MASK),
					"action_select");

		keyMap.put(KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_B, java.awt.Event.ALT_MASK),
					"escape_action");

		SwingUtilities.replaceUIActionMap(mainPanel, actionMap);
		SwingUtilities.replaceUIInputMap(mainPanel, JComponent.WHEN_IN_FOCUSED_WINDOW, keyMap);
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
				System.out.println("Entered barcode is " + barcode);
				String modelname = VtigerProducts.class.getSimpleName();
				String col_name = "barcode";
				List<VtigerProducts> products = DBLocalHelper.readRecord(modelname, col_name,
							barcode);
				if (products.size() == 0) {
					JOptionPane.showMessageDialog(null, "No product available");
				} else {
					int exist_rownum = isProductAlreadyInTable(products.get(0), barcode);
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

			}
			searchproduct_button.requestFocus(true);
		}
	};

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
				String row_barcode = (String) table_invoiceModel.getValueAt(i, barcode_colnum);
				if (row_barcode.equalsIgnoreCase(barcode)) {
					System.out.println("row_barcode: " + row_barcode + " barcode:" + barcode
								+ " exist row number: " + i);
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
			table_invoiceModel.setValueAt(rowData[netprice_index], rownumber, netprice_index);

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
			String[] invoice = { vtigerProduct.getProductNo(), vtigerProduct.getBarcode(),
					vtigerProduct.getProductname(), vtigerProduct.getUnitPrice(),
					vtigerProduct.getDiscount(), vtigerProduct.getVat() };
			rowData = calculateInvoiceData(invoice, quatity);

		}
		return rowData;

	}

	private String[] calculateInvoiceData(String[] invoice, String quantity) {
		String rowData[] = new String[table_invoiceModel.getColumnCount()];
		rowData[0] = String.valueOf(table_invoiceModel.getRowCount() + 1);
		rowData[1] = invoice[1]; // vtigerProducts.getBarcode();
		rowData[2] = invoice[2]; // vtigerProducts.getProductname();
		rowData[3] = invoice[3]; // vtigerProducts.getUnitPrice();
		rowData[4] = quantity;
		rowData[5] = invoice[4]; // vtigerProducts.getDiscount();
		rowData[6] = invoice[5]; // vtigerProducts.getVat();
		previous_quantity = Integer.parseInt(quantity);

		float unit_price = Float.parseFloat(rowData[3]);
		int qty = Integer.parseInt(rowData[4]);
		float discount = Float.parseFloat(rowData[5]);
		float vat_per = Float.parseFloat(rowData[6]);

		// calc total unit price for quantity
		unit_price = unit_price * qty;
		rowData[3] = String.valueOf(Util.Round(unit_price, 2));

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
		float grand_total = (int) Math.round(discount_unitprice + vat_amount);
		rowData[7] = String.valueOf(grand_total);
		/****************************************
		 * // update total amount label float total_amount_all = unit_price;
		 * float ptotal = Float.parseFloat(totalamount_lable.getText());
		 * 
		 * String current_total = String.valueOf(Util.Round( (total_amount_all +
		 * ptotal), 2)); totalamount_lable.setText(current_total);
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
			@Override
			public void tableChanged(TableModelEvent tme) {
				if (tme.getType() == TableModelEvent.UPDATE) {
					if (tme.getColumn() == qty_index && !CELLUPDATE) {
						String quatity = (String) table_invoiceModel.getValueAt(tme.getFirstRow(),
									tme.getColumn());
						System.out.println("Quatity updated to " + quatity);

						// read updated table row
						int columncount = table_invoiceModel.getColumnCount();
						int updatedrow = tme.getFirstRow();
						String product[] = new String[columncount];
						product[0] = (String) table_invoiceModel.getValueAt(updatedrow, 0);
						// vtigerProducts.getBarcode();
						product[1] = (String) table_invoiceModel.getValueAt(updatedrow, 1);
						// vtigerProducts.getProductname();
						product[2] = (String) table_invoiceModel.getValueAt(updatedrow, 2);
						// vtigerProducts.getUnitPrice();
						product[3] = (String) table_invoiceModel.getValueAt(updatedrow, 3);
						// vtigerProducts.getDiscount();
						product[4] = (String) table_invoiceModel.getValueAt(updatedrow, 5);
						// vtigerProducts.getVat();
						product[5] = (String) table_invoiceModel.getValueAt(updatedrow, 6);

						// Update row with invoice data
						String rowData[] = calculateInvoiceData(product, String.valueOf(quatity));
						if (rowData.length != 0) {
							CELLUPDATE = true;

							// Update the row net amount field & qty field
							// only
							table_invoiceModel
										.setValueAt(rowData[qty_index], updatedrow, qty_index);
							table_invoiceModel.setValueAt(rowData[netprice_index], updatedrow,
										netprice_index);

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
		float totaldiscount = 0;
		float totalgrand = 0;
		for (int i = 0; i < rows; i++) {
			// total amount
			float amount = Float.parseFloat((String) table_invoiceModel.getValueAt(i,
						unitprice_index))
						* Float.parseFloat((String) table_invoiceModel.getValueAt(i, qty_index));
			totalamount += amount;

			// total discount amount
			float discount = Float.parseFloat((String) table_invoiceModel.getValueAt(i,
						discount_index));
			if (discount != 0) {
				discount = Util.calculate_discount(totalamount, discount);
				totaldiscount += discount;
			}

			// grand total amount
			float gamount = Float.parseFloat((String) table_invoiceModel.getValueAt(i,
						netprice_index));
			totalgrand += gamount;

		}

		// update amounts to labels
		totalamount_lable.setText(String.valueOf(totalamount));
		discountamount_lable.setText(String.valueOf(totaldiscount));
		grandtotal_lable.setText(String.valueOf(totalgrand));
	}

	/**
	 * Prepare invoices for {@link InvoiceController} to store in local
	 * database.
	 */
	private void prepareSaveInvoice() {
		int rows = table_invoiceModel.getRowCount();
		int cols = table_invoiceModel.getColumnCount();
		String tabledata[][] = new String[rows][cols];
		invoceproduct_list = new ArrayList<InvoiceProduct>();
		netprice_list = new String[rows];
		System.out.println("Invoice table data");

		// read invoice table data to array
		for (int i = 0; i < rows; i++) {
			System.out.println();
			for (int j = 0; j < cols; j++) {
				tabledata[i][j] = (String) table_invoiceModel.getValueAt(i, j);
				System.out.print(tabledata[i][j] + "  ");
			}
		}
		System.out.println();
		// Prepare invoice products list
		System.out.println("-----------------------------------");
		System.out.println("products hash data");
		for (int i = 0; i < products_hashmap.size(); i++) {
			VtigerProducts product = products_hashmap.get(tabledata[i][1]);
			InvoiceProduct inoviceproduct = new InvoiceProduct();

			inoviceproduct.setProductid(product.getProductid());
			inoviceproduct.setBcode(product.getBarcode());
			inoviceproduct.setProductname(product.getProductname());
			inoviceproduct.setMrp(product.getUnitPrice());
			String q = (String) table_invoiceModel.getValueAt(i, 4);
			inoviceproduct.setQty(q);
			inoviceproduct.setVat(product.getVat());
			netprice_list[i] = (String) table_invoiceModel.getValueAt(i, 4);
			invoceproduct_list.add(i, inoviceproduct);
			System.out.println("invoice: " + inoviceproduct + " netprice:" + netprice_list[i]);

		}

		// Prepare invoices total data
		invoice_totalamount = Float.parseFloat(totalamount_lable.getText());
		invoice_totaldiscount = Float.parseFloat(discountamount_lable.getText());
		invoice_grandamount = Float.parseFloat(grandtotal_lable.getText());

	}
}
