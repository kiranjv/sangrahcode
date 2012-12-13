package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerCrmentitySeq;

/**
 * Home object for domain model class VtigerCrmentitySeq.
 * @see com.java.sangrah.models.VtigerCrmentitySeq
 * @author Hibernate Tools
 */
public class VtigerCrmentitySeqHome {

	private static final Log log = LogFactory
			.getLog(VtigerCrmentitySeqHome.class);

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

	public void persist(VtigerCrmentitySeq transientInstance) {
		log.debug("persisting VtigerCrmentitySeq instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerCrmentitySeq instance) {
		log.debug("attaching dirty VtigerCrmentitySeq instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerCrmentitySeq instance) {
		log.debug("attaching clean VtigerCrmentitySeq instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerCrmentitySeq persistentInstance) {
		log.debug("deleting VtigerCrmentitySeq instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerCrmentitySeq merge(VtigerCrmentitySeq detachedInstance) {
		log.debug("merging VtigerCrmentitySeq instance");
		try {
			VtigerCrmentitySeq result = (VtigerCrmentitySeq) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerCrmentitySeq findById(int id) {
		log.debug("getting VtigerCrmentitySeq instance with id: " + id);
		try {
			VtigerCrmentitySeq instance = (VtigerCrmentitySeq) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerCrmentitySeq", id);
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

	public List findByExample(VtigerCrmentitySeq instance) {
		log.debug("finding VtigerCrmentitySeq instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerCrmentitySeq")
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
