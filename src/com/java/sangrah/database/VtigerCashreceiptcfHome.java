package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerCashreceiptcf;

/**
 * Home object for domain model class VtigerCashreceiptcf.
 * @see com.java.sangrah.models.VtigerCashreceiptcf
 * @author Hibernate Tools
 */
public class VtigerCashreceiptcfHome {

	private static final Log log = LogFactory
			.getLog(VtigerCashreceiptcfHome.class);

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

	public void persist(VtigerCashreceiptcf transientInstance) {
		log.debug("persisting VtigerCashreceiptcf instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerCashreceiptcf instance) {
		log.debug("attaching dirty VtigerCashreceiptcf instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerCashreceiptcf instance) {
		log.debug("attaching clean VtigerCashreceiptcf instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerCashreceiptcf persistentInstance) {
		log.debug("deleting VtigerCashreceiptcf instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerCashreceiptcf merge(VtigerCashreceiptcf detachedInstance) {
		log.debug("merging VtigerCashreceiptcf instance");
		try {
			VtigerCashreceiptcf result = (VtigerCashreceiptcf) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerCashreceiptcf findById(int id) {
		log.debug("getting VtigerCashreceiptcf instance with id: " + id);
		try {
			VtigerCashreceiptcf instance = (VtigerCashreceiptcf) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerCashreceiptcf", id);
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

	public List findByExample(VtigerCashreceiptcf instance) {
		log.debug("finding VtigerCashreceiptcf instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerCashreceiptcf")
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
