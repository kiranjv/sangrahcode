package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerProductcollaterals;

/**
 * Home object for domain model class VtigerProductcollaterals.
 * @see com.java.sangrah.models.VtigerProductcollaterals
 * @author Hibernate Tools
 */
public class VtigerProductcollateralsHome {

	private static final Log log = LogFactory
			.getLog(VtigerProductcollateralsHome.class);

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

	public void persist(VtigerProductcollaterals transientInstance) {
		log.debug("persisting VtigerProductcollaterals instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerProductcollaterals instance) {
		log.debug("attaching dirty VtigerProductcollaterals instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerProductcollaterals instance) {
		log.debug("attaching clean VtigerProductcollaterals instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerProductcollaterals persistentInstance) {
		log.debug("deleting VtigerProductcollaterals instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerProductcollaterals merge(
			VtigerProductcollaterals detachedInstance) {
		log.debug("merging VtigerProductcollaterals instance");
		try {
			VtigerProductcollaterals result = (VtigerProductcollaterals) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerProductcollaterals findById(int id) {
		log.debug("getting VtigerProductcollaterals instance with id: " + id);
		try {
			VtigerProductcollaterals instance = (VtigerProductcollaterals) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerProductcollaterals",
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

	public List findByExample(VtigerProductcollaterals instance) {
		log.debug("finding VtigerProductcollaterals instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerProductcollaterals")
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
