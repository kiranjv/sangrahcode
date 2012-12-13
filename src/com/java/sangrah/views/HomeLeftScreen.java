package com.java.sangrah.views;

import java.awt.Color;
import java.util.Enumeration;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTree;
import javax.swing.border.Border;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeNode;
import javax.swing.tree.TreePath;

public class HomeLeftScreen extends JPanel implements TreeSelectionListener {

	JPanel MainPanel;
	private JTree tree;
	private DefaultMutableTreeNode root;
	private DefaultMutableTreeNode child;
	private DefaultMutableTreeNode grandChild;

	public HomeLeftScreen() {
		initScreen();

	}

	private void initScreen() {
		MainPanel = new JPanel();
		MainPanel.setBounds(10, 10, 250, 500);
		MainPanel.setOpaque(true);
		MainPanel.setBackground(Color.white);
		root = new DefaultMutableTreeNode("Root");
		tree = new JTree(root);
		tree.setBounds(10, 10, 250, 500);

		// initialize sub tree elements
		for (int childIndex = 1; childIndex < 4; childIndex++) {
			child = new DefaultMutableTreeNode("Child " + childIndex);
			root.add(child);
			for (int grandChildIndex = 1; grandChildIndex < 4; grandChildIndex++) {
				grandChild = new DefaultMutableTreeNode("Grandchild "
						+ childIndex + "." + grandChildIndex);
				child.add(grandChild);

			}
		}

		TreePath rootPath = new TreePath(root);

		tree.expandPath(rootPath);

		MainPanel.add(tree);
		add(MainPanel);
		setSize(250, 500);
	}

	public static void main(String[] args) {
		JFrame frame = new JFrame();
		HomeLeftScreen leftpart = new HomeLeftScreen();
		frame.add(leftpart);
		frame.setSize(400, 600);
		frame.show(true);
	}

	@Override
	public void valueChanged(TreeSelectionEvent e) {
		System.out.println("Leaf node selected: "
				+ tree.getLastSelectedPathComponent().toString());
	}

	public void getPaths(JTree tree, TreePath parent, boolean expanded,
			List<TreePath> list) {
		if (expanded && !tree.isVisible(parent)) {
			return;
		}
		list.add(parent);

		TreeNode node = (TreeNode) parent.getLastPathComponent();
		if (node.getChildCount() >= 0) {
			for (Enumeration e = node.children(); e.hasMoreElements();) {
				TreeNode n = (TreeNode) e.nextElement();
				TreePath path = parent.pathByAddingChild(n);
				getPaths(tree, path, expanded, list);
			}
		}
	}

}
