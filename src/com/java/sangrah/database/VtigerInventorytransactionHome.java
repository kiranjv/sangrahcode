package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerInventorytransaction;

/**
 * Home object for domain model class VtigerInventorytransaction.
 * @see com.java.sangrah.models.VtigerInventorytransaction
 * @author Hibernate Tools
 */
public class VtigerInventorytransactionHome {

	private static final Log log = LogFactory
			.getLog(VtigerInventorytransactionHome.class);

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

	public void persist(VtigerInventorytransaction transientInstance) {
		log.debug("persisting VtigerInventorytransaction instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerInventorytransaction instance) {
		log.debug("attaching dirty VtigerInventorytransaction instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerInventorytransaction instance) {
		log.debug("attaching clean VtigerInventorytransaction instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerInventorytransaction persistentInstance) {
		log.debug("deleting VtigerInventorytransaction instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerInventorytransaction merge(
			VtigerInventorytransaction detachedInstance) {
		log.debug("merging VtigerInventorytransaction instance");
		try {
			VtigerInventorytransaction result = (VtigerInventorytransaction) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerInventorytransaction findById(int id) {
		log.debug("getting VtigerInventorytransaction instance with id: " + id);
		try {
			VtigerInventorytransaction instance = (VtigerInventorytransaction) sessionFactory
					.getCurrentSession()
					.get("com.java.sangrah.models.VtigerInventorytransaction",
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

	public List findByExample(VtigerInventorytransaction instance) {
		log.debug("finding VtigerInventorytransaction instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerInventorytransaction")
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
