/**
 * 
 */
package com.java.sangrah.repos;

import java.util.Collection;
import java.util.List;

/**
 * @author treewalker
 * 
 */
public interface IRepository {

	// read entity's from server database
	/**
	 * This method read entity's from server database tables and return the
	 * entitys as list.
	 * 
	 * @param startindex
	 *            - Represent starting row id
	 * @return - {@link List} of collection of entity's.
	 */
	public List readServerEntitys(int startindex);

	/**
	 * This method read entity's from server database tables and return the
	 * entitys as list.
	 * 
	 * @return - {@link List} of collection of entity's.
	 */
	public List readServerEntitys();

	/**
	 * This method read entity's from server database tables and return the
	 * entitys as list.
	 * 
	 * @param startindex
	 *            - Represent starting row id
	 * @param endindex
	 *            - Represent end row id
	 * @return - {@link List} of collection of entity's.
	 */
	public List readServerEntitys(int startindex, int endindex);

	// store entity's to server database
	/**
	 * This method is responsible for storing list of entityes into server
	 * database.
	 * 
	 * @param entitys
	 *            - Entitys to store in server databse.
	 * @return - true represent store success otherwise false.
	 */
	public boolean sendServerEntitys(List entitys);

	// read entity's from local database
	/**
	 * This method read entity's from local database tables and return the
	 * entitys as list.
	 * 
	 * @param startindex
	 *            - Represent starting row id
	 * @return - {@link List} of collection of entity's.
	 */
	public List readLocalEntitys(int startindex);

	/**
	 * This method read entity's from local database tables and return the
	 * entitys as list.
	 * 
	 * @return - {@link List} of collection of entity's.
	 */
	public List readLocalEntitys();

	/**
	 * This method read entity's from locl database tables and return the
	 * entitys as list.
	 * 
	 * @param startindex
	 *            - Represent starting row id
	 * @param endindex
	 *            - Represent end row id
	 * @return - {@link List} of collection of entity's.
	 */
	public List readLocalEntitys(int startindex, int endindex);

	// store entity's to local database
	/**
	 * This method is responsible to store list of entityes into local database.
	 * 
	 * @param entitys
	 *            - {@link Collection} of entity's to store in server databse.
	 * @return - true represent store success otherwise false.
	 */
	public boolean storeLocalEntitys(List entitys);

	/**
	 * This method is responsible to store into local database.
	 * 
	 * @param entity
	 *            - Entity to store in local databse.
	 * @return - true represent store success otherwise false.
	 */
	public boolean storeLocalEntitys(Object entity);

	// store entity's to local database
	/**
	 * This method is responsible to delete list of entityes into local
	 * database.
	 * 
	 * @param entitys
	 *            - {@link Collection} of entity's to store in server databse.
	 * @return - true represent store success otherwise false.
	 */
	public boolean deleteLocalEntitys(List entitys);

	/**
	 * This method is responsible to delete into local database.
	 * 
	 * @param entity
	 *            - Entity to store in local databse.
	 * @return - true represent store success otherwise false.
	 */
	public boolean deleteLocalEntitys(Object entity);

}
