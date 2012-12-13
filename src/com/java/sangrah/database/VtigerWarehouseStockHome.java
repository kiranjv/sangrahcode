package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerWarehouseStock;

/**
 * Home object for domain model class VtigerWarehouseStock.
 * @see com.java.sangrah.models.VtigerWarehouseStock
 * @author Hibernate Tools
 */
public class VtigerWarehouseStockHome {

	private static final Log log = LogFactory
			.getLog(VtigerWarehouseStockHome.class);

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

	public void persist(VtigerWarehouseStock transientInstance) {
		log.debug("persisting VtigerWarehouseStock instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerWarehouseStock instance) {
		log.debug("attaching dirty VtigerWarehouseStock instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerWarehouseStock instance) {
		log.debug("attaching clean VtigerWarehouseStock instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerWarehouseStock persistentInstance) {
		log.debug("deleting VtigerWarehouseStock instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerWarehouseStock merge(VtigerWarehouseStock detachedInstance) {
		log.debug("merging VtigerWarehouseStock instance");
		try {
			VtigerWarehouseStock result = (VtigerWarehouseStock) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerWarehouseStock findById(int id) {
		log.debug("getting VtigerWarehouseStock instance with id: " + id);
		try {
			VtigerWarehouseStock instance = (VtigerWarehouseStock) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerWarehouseStock", id);
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

	public List findByExample(VtigerWarehouseStock instance) {
		log.debug("finding VtigerWarehouseStock instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"com.java.sangrah.models.VtigerWarehouseStock")
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
