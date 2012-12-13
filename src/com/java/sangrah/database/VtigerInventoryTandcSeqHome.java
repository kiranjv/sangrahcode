package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerInventoryTandcSeq;

/**
 * Home object for domain model class VtigerInventoryTandcSeq.
 * @see com.java.sangrah.models.VtigerInventoryTandcSeq
 * @author Hibernate Tools
 */
public class VtigerInventoryTandcSeqHome {

	private static final Log log = LogFactory
			.getLog(VtigerInventoryTandcSeqHome.class);

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

	public void persist(VtigerInventoryTandcSeq transientInstance) {
		log.debug("persisting VtigerInventoryTandcSeq instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerInventoryTandcSeq instance) {
		log.debug("attaching dirty VtigerInventoryTandcSeq instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerInventoryTandcSeq instance) {
		log.debug("attaching clean VtigerInventoryTandcSeq instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerInventoryTandcSeq persistentInstance) {
		log.debug("deleting VtigerInventoryTandcSeq instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerInventoryTandcSeq merge(
			VtigerInventoryTandcSeq detachedInstance) {
		log.debug("merging VtigerInventoryTandcSeq instance");
		try {
			VtigerInventoryTandcSeq result = (VtigerInventoryTandcSeq) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerInventoryTandcSeq findById(int id) {
		log.debug("getting VtigerInventoryTandcSeq instance with id: " + id);
		try {
			VtigerInventoryTandcSeq instance = (VtigerInventoryTandcSeq) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerInventoryTandcSeq",
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

	public List findByExample(VtigerInventoryTandcSeq instance) {
		log.debug("finding VtigerInventoryTandcSeq instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerInventoryTandcSeq")
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
