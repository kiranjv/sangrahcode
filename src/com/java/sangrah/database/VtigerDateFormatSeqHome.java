package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerDateFormatSeq;

/**
 * Home object for domain model class VtigerDateFormatSeq.
 * @see com.java.sangrah.models.VtigerDateFormatSeq
 * @author Hibernate Tools
 */
public class VtigerDateFormatSeqHome {

	private static final Log log = LogFactory
			.getLog(VtigerDateFormatSeqHome.class);

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

	public void persist(VtigerDateFormatSeq transientInstance) {
		log.debug("persisting VtigerDateFormatSeq instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerDateFormatSeq instance) {
		log.debug("attaching dirty VtigerDateFormatSeq instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerDateFormatSeq instance) {
		log.debug("attaching clean VtigerDateFormatSeq instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerDateFormatSeq persistentInstance) {
		log.debug("deleting VtigerDateFormatSeq instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerDateFormatSeq merge(VtigerDateFormatSeq detachedInstance) {
		log.debug("merging VtigerDateFormatSeq instance");
		try {
			VtigerDateFormatSeq result = (VtigerDateFormatSeq) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerDateFormatSeq findById(int id) {
		log.debug("getting VtigerDateFormatSeq instance with id: " + id);
		try {
			VtigerDateFormatSeq instance = (VtigerDateFormatSeq) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerDateFormatSeq", id);
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

	public List findByExample(VtigerDateFormatSeq instance) {
		log.debug("finding VtigerDateFormatSeq instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerDateFormatSeq")
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
