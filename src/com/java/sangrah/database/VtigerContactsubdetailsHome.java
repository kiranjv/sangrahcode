package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerContactsubdetails;

/**
 * Home object for domain model class VtigerContactsubdetails.
 * @see com.java.sangrah.models.VtigerContactsubdetails
 * @author Hibernate Tools
 */
public class VtigerContactsubdetailsHome {

	private static final Log log = LogFactory
			.getLog(VtigerContactsubdetailsHome.class);

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

	public void persist(VtigerContactsubdetails transientInstance) {
		log.debug("persisting VtigerContactsubdetails instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerContactsubdetails instance) {
		log.debug("attaching dirty VtigerContactsubdetails instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerContactsubdetails instance) {
		log.debug("attaching clean VtigerContactsubdetails instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerContactsubdetails persistentInstance) {
		log.debug("deleting VtigerContactsubdetails instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerContactsubdetails merge(
			VtigerContactsubdetails detachedInstance) {
		log.debug("merging VtigerContactsubdetails instance");
		try {
			VtigerContactsubdetails result = (VtigerContactsubdetails) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerContactsubdetails findById(int id) {
		log.debug("getting VtigerContactsubdetails instance with id: " + id);
		try {
			VtigerContactsubdetails instance = (VtigerContactsubdetails) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerContactsubdetails",
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

	public List findByExample(VtigerContactsubdetails instance) {
		log.debug("finding VtigerContactsubdetails instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerContactsubdetails")
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
