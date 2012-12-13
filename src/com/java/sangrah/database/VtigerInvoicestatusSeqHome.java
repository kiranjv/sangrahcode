package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerInvoicestatusSeq;

/**
 * Home object for domain model class VtigerInvoicestatusSeq.
 * @see com.java.sangrah.models.VtigerInvoicestatusSeq
 * @author Hibernate Tools
 */
public class VtigerInvoicestatusSeqHome {

	private static final Log log = LogFactory
			.getLog(VtigerInvoicestatusSeqHome.class);

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

	public void persist(VtigerInvoicestatusSeq transientInstance) {
		log.debug("persisting VtigerInvoicestatusSeq instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerInvoicestatusSeq instance) {
		log.debug("attaching dirty VtigerInvoicestatusSeq instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerInvoicestatusSeq instance) {
		log.debug("attaching clean VtigerInvoicestatusSeq instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerInvoicestatusSeq persistentInstance) {
		log.debug("deleting VtigerInvoicestatusSeq instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerInvoicestatusSeq merge(VtigerInvoicestatusSeq detachedInstance) {
		log.debug("merging VtigerInvoicestatusSeq instance");
		try {
			VtigerInvoicestatusSeq result = (VtigerInvoicestatusSeq) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerInvoicestatusSeq findById(int id) {
		log.debug("getting VtigerInvoicestatusSeq instance with id: " + id);
		try {
			VtigerInvoicestatusSeq instance = (VtigerInvoicestatusSeq) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerInvoicestatusSeq",
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

	public List findByExample(VtigerInvoicestatusSeq instance) {
		log.debug("finding VtigerInvoicestatusSeq instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerInvoicestatusSeq")
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
