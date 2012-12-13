package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerInventoryshippingrel;
import com.java.sangrah.models.VtigerInventoryshippingrelId;

/**
 * Home object for domain model class VtigerInventoryshippingrel.
 * @see com.java.sangrah.models.VtigerInventoryshippingrel
 * @author Hibernate Tools
 */
public class VtigerInventoryshippingrelHome {

	private static final Log log = LogFactory
			.getLog(VtigerInventoryshippingrelHome.class);

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

	public void persist(VtigerInventoryshippingrel transientInstance) {
		log.debug("persisting VtigerInventoryshippingrel instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerInventoryshippingrel instance) {
		log.debug("attaching dirty VtigerInventoryshippingrel instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerInventoryshippingrel instance) {
		log.debug("attaching clean VtigerInventoryshippingrel instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerInventoryshippingrel persistentInstance) {
		log.debug("deleting VtigerInventoryshippingrel instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerInventoryshippingrel merge(
			VtigerInventoryshippingrel detachedInstance) {
		log.debug("merging VtigerInventoryshippingrel instance");
		try {
			VtigerInventoryshippingrel result = (VtigerInventoryshippingrel) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerInventoryshippingrel findById(
			com.java.sangrah.models.VtigerInventoryshippingrelId id) {
		log.debug("getting VtigerInventoryshippingrel instance with id: " + id);
		try {
			VtigerInventoryshippingrel instance = (VtigerInventoryshippingrel) sessionFactory
					.getCurrentSession()
					.get("com.java.sangrah.models.VtigerInventoryshippingrel",
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

	public List findByExample(VtigerInventoryshippingrel instance) {
		log.debug("finding VtigerInventoryshippingrel instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerInventoryshippingrel")
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
