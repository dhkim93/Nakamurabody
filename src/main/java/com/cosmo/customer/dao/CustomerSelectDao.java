package com.cosmo.customer.dao;

import java.util.List;

import com.cosmo.vo.CustomerSelectVO;

public interface CustomerSelectDao {

	public List<CustomerSelectVO> selectCustomer(CustomerSelectVO customerSelectVO) throws Exception;
	public List<CustomerSelectVO> detailCustomer(CustomerSelectVO customerSelectVO) throws Exception;
	
}
