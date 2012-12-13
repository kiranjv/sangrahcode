package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerCashreturndetails;

/**
 * Home object for domain model class VtigerCashreturndetails.
 * @see com.java.sangrah.models.VtigerCashreturndetails
 * @author Hibernate Tools
 */
public class VtigerCashreturndetailsHome {

	private static final Log log = LogFactory
			.getLog(VtigerCashreturndetailsHome.class);

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

	public void persist(VtigerCashreturndetails transientInstance) {
		log.debug("persisting VtigerCashreturndetails instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerCashreturndetails instance) {
		log.debug("attaching dirty VtigerCashreturndetails instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerCashreturndetails instance) {
		log.debug("attaching clean VtigerCashreturndetails instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerCashreturndetails persistentInstance) {
		log.debug("deleting VtigerCashreturndetails instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerCashreturndetails merge(
			VtigerCashreturndetails detachedInstance) {
		log.debug("merging VtigerCashreturndetails instance");
		try {
			VtigerCashreturndetails result = (VtigerCashreturndetails) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerCashreturndetails findById(int id) {
		log.debug("getting VtigerCashreturndetails instance with id: " + id);
		try {
			VtigerCashreturndetails instance = (VtigerCashreturndetails) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerCashreturndetails",
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

	public List findByExample(VtigerCashreturndetails instance) {
		log.debug("finding VtigerCashreturndetails instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerCashreturndetails")
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
