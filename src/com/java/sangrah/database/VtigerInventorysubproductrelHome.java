package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerInventorysubproductrel;
import com.java.sangrah.models.VtigerInventorysubproductrelId;

/**
 * Home object for domain model class VtigerInventorysubproductrel.
 * @see com.java.sangrah.models.VtigerInventorysubproductrel
 * @author Hibernate Tools
 */
public class VtigerInventorysubproductrelHome {

	private static final Log log = LogFactory
			.getLog(VtigerInventorysubproductrelHome.class);

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

	public void persist(VtigerInventorysubproductrel transientInstance) {
		log.debug("persisting VtigerInventorysubproductrel instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerInventorysubproductrel instance) {
		log.debug("attaching dirty VtigerInventorysubproductrel instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerInventorysubproductrel instance) {
		log.debug("attaching clean VtigerInventorysubproductrel instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerInventorysubproductrel persistentInstance) {
		log.debug("deleting VtigerInventorysubproductrel instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerInventorysubproductrel merge(
			VtigerInventorysubproductrel detachedInstance) {
		log.debug("merging VtigerInventorysubproductrel instance");
		try {
			VtigerInventorysubproductrel result = (VtigerInventorysubproductrel) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerInventorysubproductrel findById(
			com.java.sangrah.models.VtigerInventorysubproductrelId id) {
		log.debug("getting VtigerInventorysubproductrel instance with id: "
				+ id);
		try {
			VtigerInventorysubproductrel instance = (VtigerInventorysubproductrel) sessionFactory
					.getCurrentSession()
					.get("com.java.sangrah.models.VtigerInventorysubproductrel",
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

	public List findByExample(VtigerInventorysubproductrel instance) {
		log.debug("finding VtigerInventorysubproductrel instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerInventorysubproductrel")
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
