package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerProducttaxrel;
import com.java.sangrah.models.VtigerProducttaxrelId;

/**
 * Home object for domain model class VtigerProducttaxrel.
 * @see com.java.sangrah.models.VtigerProducttaxrel
 * @author Hibernate Tools
 */
public class VtigerProducttaxrelHome {

	private static final Log log = LogFactory
			.getLog(VtigerProducttaxrelHome.class);

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

	public void persist(VtigerProducttaxrel transientInstance) {
		log.debug("persisting VtigerProducttaxrel instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerProducttaxrel instance) {
		log.debug("attaching dirty VtigerProducttaxrel instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerProducttaxrel instance) {
		log.debug("attaching clean VtigerProducttaxrel instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerProducttaxrel persistentInstance) {
		log.debug("deleting VtigerProducttaxrel instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerProducttaxrel merge(VtigerProducttaxrel detachedInstance) {
		log.debug("merging VtigerProducttaxrel instance");
		try {
			VtigerProducttaxrel result = (VtigerProducttaxrel) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerProducttaxrel findById(
			com.java.sangrah.models.VtigerProducttaxrelId id) {
		log.debug("getting VtigerProducttaxrel instance with id: " + id);
		try {
			VtigerProducttaxrel instance = (VtigerProducttaxrel) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerProducttaxrel", id);
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

	public List findByExample(VtigerProducttaxrel instance) {
		log.debug("finding VtigerProducttaxrel instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerProducttaxrel")
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
