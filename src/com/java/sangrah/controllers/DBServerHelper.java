package com.java.sangrah.controllers;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.java.sangrah.repos.ServerDBConfiguration;


public class DBServerHelper {

	private static SessionFactory serverDBSessionFactory = ServerDBConfiguration
			.getServerDBSessionFactory();

	public static List readRecords(String modelname, String columnname,
			int startindex) {

		Session session = serverDBSessionFactory.openSession();
		Transaction transaction = null;
		List entitys = null;
		try {
			transaction = session.beginTransaction();
			entitys = session.createQuery(
					"FROM " + modelname + " where " + columnname + " >= "
							+ String.valueOf(startindex)).list();
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return entitys;

	}

	public static List readRecords(String modelname, String columnname,
			int startindex, int endindex) {
		Session session = serverDBSessionFactory.openSession();
		Transaction transaction = null;
		List entitys = null;
		try {
			transaction = session.beginTransaction();
			entitys = session.createQuery(
					"FROM " + modelname + " where " + columnname + " >= "
							+ String.valueOf(startindex) + " and " + columnname
							+ " <=" + String.valueOf(endindex)).list();

			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return entitys;

	}

	public static List readRecord(String modelname, String columnname, int id) {
		Session session = serverDBSessionFactory.openSession();
		Transaction transaction = null;
		List entitys = null;
		try {
			transaction = session.beginTransaction();
			entitys = session.createQuery(
					"FROM " + modelname + " where " + columnname + " = "
							+ String.valueOf(id)).list();
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return entitys;
	}

	public static List readRecords(String modelname) {
		Session session = serverDBSessionFactory.openSession();
		Transaction transaction = null;
		List entitys = null;
		try {
			transaction = session.beginTransaction();
			entitys = session.createQuery("FROM " + modelname).list();
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return entitys;
	}

	public static boolean saveRecord(String modelname, Object model) {
		Session session = serverDBSessionFactory.openSession();
		Transaction tx = null;
		boolean status = true;
		try {
			tx = session.beginTransaction();
			session.save(model);
			tx.commit();
		} catch (HibernateException e) {
			status = false;
			if (tx != null)
				tx.rollback();
			status = false;
			e.printStackTrace();
		} finally {
			session.close();
		}
		return status;
	}

	public static boolean saveRecords(String modelname, List objects) {
		boolean status = false;
		for (int i = 0; i < objects.size(); i++) {
			status = saveRecord(modelname, objects.get(i));
		}
		return status;

	}

	public static boolean deleteRecord(String modelname, List objects) {
		boolean status = false;
		for (int i = 0; i < objects.size(); i++) {
			status = deleteRecord(modelname, objects.get(i));
		}
		return status;
	}

	public static boolean deleteRecord(String modelname, Object object) {
		Session session = serverDBSessionFactory.openSession();
		Transaction tx = null;
		boolean status = true;
		try {
			tx = session.beginTransaction();
			session.delete(object);
			tx.commit();
		} catch (HibernateException e) {
			status = false;
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return status;
	}

	public static boolean updateRecord(String modelname, Object object) {
		Session session = serverDBSessionFactory.openSession();
		Transaction tx = null;
		boolean status = true;
		try {
			tx = session.beginTransaction();
			session.update(object);
			tx.commit();
		} catch (HibernateException e) {
			status = false;
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return status;
	}

	public static boolean updateRecord(String modelname, List objects) {
		boolean status = false;
		for (int i = 0; i < objects.size(); i++) {
			status = updateRecord(modelname, objects.get(i));
		}
		return status;

	}

	public static int getRowCount(String modelname) {
		Session openSession = serverDBSessionFactory.openSession();
		int count = ((Integer) openSession.createQuery(
				"select count(*) from " + modelname).uniqueResult()).intValue();
		openSession.close();
		return count;
	}

	public static int deleteRecords(String modelname) {
		Session openSession = serverDBSessionFactory.openSession();
		int result =  openSession
				.createQuery("delete " + modelname).executeUpdate();
		openSession.close();
		return result;

	}

}
