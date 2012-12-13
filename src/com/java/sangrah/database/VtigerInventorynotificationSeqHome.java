package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerInventorynotificationSeq;

/**
 * Home object for domain model class VtigerInventorynotificationSeq.
 * @see com.java.sangrah.models.VtigerInventorynotificationSeq
 * @author Hibernate Tools
 */
public class VtigerInventorynotificationSeqHome {

	private static final Log log = LogFactory
			.getLog(VtigerInventorynotificationSeqHome.class);

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

	public void persist(VtigerInventorynotificationSeq transientInstance) {
		log.debug("persisting VtigerInventorynotificationSeq instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerInventorynotificationSeq instance) {
		log.debug("attaching dirty VtigerInventorynotificationSeq instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerInventorynotificationSeq instance) {
		log.debug("attaching clean VtigerInventorynotificationSeq instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerInventorynotificationSeq persistentInstance) {
		log.debug("deleting VtigerInventorynotificationSeq instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerInventorynotificationSeq merge(
			VtigerInventorynotificationSeq detachedInstance) {
		log.debug("merging VtigerInventorynotificationSeq instance");
		try {
			VtigerInventorynotificationSeq result = (VtigerInventorynotificationSeq) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerInventorynotificationSeq findById(int id) {
		log.debug("getting VtigerInventorynotificationSeq instance with id: "
				+ id);
		try {
			VtigerInventorynotificationSeq instance = (VtigerInventorynotificationSeq) sessionFactory
					.getCurrentSession()
					.get("com.java.sangrah.models.VtigerInventorynotificationSeq",
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

	public List findByExample(VtigerInventorynotificationSeq instance) {
		log.debug("finding VtigerInventorynotificationSeq instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerInventorynotificationSeq")
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
