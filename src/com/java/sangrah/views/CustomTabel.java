package com.java.sangrah.views;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;

import javax.swing.JComponent;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

public class CustomTabel extends JTable {
	DefaultTableModel table_invoiceModel;

	public CustomTabel(DefaultTableModel table_invoiceModel) {
		this.table_invoiceModel = table_invoiceModel;
		
	}

	
	public Class getColumnClass(int column) {
		return getValueAt(0, column).getClass();
	}

	@Override
	public void setRowMargin(int rowMargin) {
		// TODO Auto-generated method stub
		super.setRowMargin(3);
	}

	@Override
	public void setRowHeight(int row, int rowHeight) {
		// TODO Auto-generated method stub
		super.setRowHeight(row, 150);
	}

	@Override
	public void setFont(Font font) {

		super.setFont(new Font("Arial", Font.BOLD, 14));
	}

	public Component prepareRenderer(TableCellRenderer renderer, int row, int column) {
		Component c = super.prepareRenderer(renderer, row, column);
		JComponent jc = (JComponent) c;

		if (!isRowSelected(row))
			// c.setBackground(row % 2 == 0 ? getBackground() : Color.white);
			c.setBackground(Color.white);

		else {
		}
		// jc.setBorder(new MatteBorder(1, 0, 1, 0, Color.GREEN));

		return c;
	}
};
