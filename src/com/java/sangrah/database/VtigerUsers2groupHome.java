package com.java.sangrah.database;



// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerUsers2group;

/**
 * Home object for domain model class VtigerUsers2group.
 * @see com.java.sangrah.models.VtigerUsers2group
 * @author Hibernate Tools
 */
public class VtigerUsers2groupHome {

	private static final Log log = LogFactory
			.getLog(VtigerUsers2groupHome.class);

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

	public void persist(VtigerUsers2group transientInstance) {
		log.debug("persisting VtigerUsers2group instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerUsers2group instance) {
		log.debug("attaching dirty VtigerUsers2group instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerUsers2group instance) {
		log.debug("attaching clean VtigerUsers2group instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerUsers2group persistentInstance) {
		log.debug("deleting VtigerUsers2group instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerUsers2group merge(VtigerUsers2group detachedInstance) {
		log.debug("merging VtigerUsers2group instance");
		try {
			VtigerUsers2group result = (VtigerUsers2group) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerUsers2group findById(
			com.java.sangrah.models.VtigerUsers2groupId id) {
		log.debug("getting VtigerUsers2group instance with id: " + id);
		try {
			VtigerUsers2group instance = (VtigerUsers2group) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerUsers2group", id);
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

	public List findByExample(VtigerUsers2group instance) {
		log.debug("finding VtigerUsers2group instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria("com.java.sangrah.models.VtigerUsers2group")
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
