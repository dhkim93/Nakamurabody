package com.cosmo.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.customer.dao.CustomerSelectDao;
import com.cosmo.vo.CustomerSelectVO;

@Service
public class CustomerSelectServiceImpl implements CustomerSelectService {
	
	@Autowired
	private CustomerSelectDao customerSelectDao;
	
//	public void setCustomerSelectDao(CustomerSelectDao customerSelectDao) {
//		this.customerSelectDao = customerSelectDao;
//	}

	@Override
	public List<CustomerSelectVO> selectCustomer(CustomerSelectVO customerSelectVO) throws Exception {
		return customerSelectDao.selectCustomer(customerSelectVO);
	}

	@Override
	public List<CustomerSelectVO> detailCustomer(CustomerSelectVO customerSelectVO) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return customerSelectDao.detailCustomer(customerSelectVO);
	}
	
	
}
