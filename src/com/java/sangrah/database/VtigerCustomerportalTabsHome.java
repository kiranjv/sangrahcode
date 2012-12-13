package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerCustomerportalTabs;

/**
 * Home object for domain model class VtigerCustomerportalTabs.
 * @see com.java.sangrah.models.VtigerCustomerportalTabs
 * @author Hibernate Tools
 */
public class VtigerCustomerportalTabsHome {

	private static final Log log = LogFactory
			.getLog(VtigerCustomerportalTabsHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(VtigerCustomerportalTabs transientInstance) {
		log.debug("persisting VtigerCustomerportalTabs instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerCustomerportalTabs instance) {
		log.debug("attaching dirty VtigerCustomerportalTabs instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerCustomerportalTabs instance) {
		log.debug("attaching clean VtigerCustomerportalTabs instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerCustomerportalTabs persistentInstance) {
		log.debug("deleting VtigerCustomerportalTabs instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerCustomerportalTabs merge(
			VtigerCustomerportalTabs detachedInstance) {
		log.debug("merging VtigerCustomerportalTabs instance");
		try {
			VtigerCustomerportalTabs result = (VtigerCustomerportalTabs) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerCustomerportalTabs findById(int id) {
		log.debug("getting VtigerCustomerportalTabs instance with id: " + id);
		try {
			VtigerCustomerportalTabs instance = (VtigerCustomerportalTabs) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerCustomerportalTabs",
							id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(VtigerCustomerportalTabs instance) {
		log.debug("finding VtigerCustomerportalTabs instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerCustomerportalTabs")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
