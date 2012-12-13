package com.java.sangrah.database;

// Generated Nov 17, 2012 10:58:26 AM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.java.sangrah.models.VtigerUser2role;

/**
 * Home object for domain model class VtigerUser2role.
 * @see com.java.sangrah.models.VtigerUser2role
 * @author Hibernate Tools
 */
public class VtigerUser2roleHome {

	private static final Log log = LogFactory.getLog(VtigerUser2roleHome.class);

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

	public void persist(VtigerUser2role transientInstance) {
		log.debug("persisting VtigerUser2role instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(VtigerUser2role instance) {
		log.debug("attaching dirty VtigerUser2role instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VtigerUser2role instance) {
		log.debug("attaching clean VtigerUser2role instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(VtigerUser2role persistentInstance) {
		log.debug("deleting VtigerUser2role instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VtigerUser2role merge(VtigerUser2role detachedInstance) {
		log.debug("merging VtigerUser2role instance");
		try {
			VtigerUser2role result = (VtigerUser2role) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public VtigerUser2role findById(int id) {
		log.debug("getting VtigerUser2role instance with id: " + id);
		try {
			VtigerUser2role instance = (VtigerUser2role) sessionFactory
					.getCurrentSession().get(
							"com.java.sangrah.models.VtigerUser2role", id);
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

	public List findByExample(VtigerUser2role instance) {
		log.debug("finding VtigerUser2role instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("com.java.sangrah.models.VtigerUser2role")
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
