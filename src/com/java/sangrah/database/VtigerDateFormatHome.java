package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerDateFormat;

/**
 * Home object for domain model class VtigerDateFormat.
 * @see com.java.sangrah.models.VtigerDateFormat
 * @author Hibernate Tools
 */
public class VtigerDateFormatHome {

	private static final Log log = LogFactory
			.getLog(VtigerDateFormatHome.class);

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

	public void persist(VtigerDateFormat transientInstance) {
		log.debug("persisting VtigerDateFormat instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerDateFormat instance) {
		log.debug("attaching dirty VtigerDateFormat instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerDateFormat instance) {
		log.debug("attaching clean VtigerDateFormat instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerDateFormat persistentInstance) {
		log.debug("deleting VtigerDateFormat instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerDateFormat merge(VtigerDateFormat detachedInstance) {
		log.debug("merging VtigerDateFormat instance");
		try {
			VtigerDateFormat result = (VtigerDateFormat) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerDateFormat findById(int id) {
		log.debug("getting VtigerDateFormat instance with id: " + id);
		try {
			VtigerDateFormat instance = (VtigerDateFormat) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerDateFormat", id);
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

	public List findByExample(VtigerDateFormat instance) {
		log.debug("finding VtigerDateFormat instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("com.java.sangrah.models.VtigerDateFormat")
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
