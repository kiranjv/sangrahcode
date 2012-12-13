package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerInvoiceRecurringInfo;
import com.java.sangrah.models.VtigerInvoiceRecurringInfoId;

/**
 * Home object for domain model class VtigerInvoiceRecurringInfo.
 * @see com.java.sangrah.models.VtigerInvoiceRecurringInfo
 * @author Hibernate Tools
 */
public class VtigerInvoiceRecurringInfoHome {

	private static final Log log = LogFactory
			.getLog(VtigerInvoiceRecurringInfoHome.class);

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

	public void persist(VtigerInvoiceRecurringInfo transientInstance) {
		log.debug("persisting VtigerInvoiceRecurringInfo instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerInvoiceRecurringInfo instance) {
		log.debug("attaching dirty VtigerInvoiceRecurringInfo instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerInvoiceRecurringInfo instance) {
		log.debug("attaching clean VtigerInvoiceRecurringInfo instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerInvoiceRecurringInfo persistentInstance) {
		log.debug("deleting VtigerInvoiceRecurringInfo instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerInvoiceRecurringInfo merge(
			VtigerInvoiceRecurringInfo detachedInstance) {
		log.debug("merging VtigerInvoiceRecurringInfo instance");
		try {
			VtigerInvoiceRecurringInfo result = (VtigerInvoiceRecurringInfo) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerInvoiceRecurringInfo findById(
			com.java.sangrah.models.VtigerInvoiceRecurringInfoId id) {
		log.debug("getting VtigerInvoiceRecurringInfo instance with id: " + id);
		try {
			VtigerInvoiceRecurringInfo instance = (VtigerInvoiceRecurringInfo) sessionFactory
					.getCurrentSession()
					.get("com.java.sangrah.models.VtigerInvoiceRecurringInfo",
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

	public List findByExample(VtigerInvoiceRecurringInfo instance) {
		log.debug("finding VtigerInvoiceRecurringInfo instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerInvoiceRecurringInfo")
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
