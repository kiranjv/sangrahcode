package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerInventorynotification;

/**
 * Home object for domain model class VtigerInventorynotification.
 * @see com.java.sangrah.models.VtigerInventorynotification
 * @author Hibernate Tools
 */
public class VtigerInventorynotificationHome {

	private static final Log log = LogFactory
			.getLog(VtigerInventorynotificationHome.class);

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

	public void persist(VtigerInventorynotification transientInstance) {
		log.debug("persisting VtigerInventorynotification instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerInventorynotification instance) {
		log.debug("attaching dirty VtigerInventorynotification instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerInventorynotification instance) {
		log.debug("attaching clean VtigerInventorynotification instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerInventorynotification persistentInstance) {
		log.debug("deleting VtigerInventorynotification instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerInventorynotification merge(
			VtigerInventorynotification detachedInstance) {
		log.debug("merging VtigerInventorynotification instance");
		try {
			VtigerInventorynotification result = (VtigerInventorynotification) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerInventorynotification findById(int id) {
		log.debug("getting VtigerInventorynotification instance with id: " + id);
		try {
			VtigerInventorynotification instance = (VtigerInventorynotification) sessionFactory
					.getCurrentSession()
					.get("com.java.sangrah.models.VtigerInventorynotification",
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

	public List findByExample(VtigerInventorynotification instance) {
		log.debug("finding VtigerInventorynotification instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerInventorynotification")
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
