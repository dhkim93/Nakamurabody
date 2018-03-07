package com.cosmo.customer.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.CustomerSelectVO;

public class CustomerSelectDaoImpl extends SqlSessionDaoSupport implements CustomerSelectDao {

	@Override
	public List<CustomerSelectVO> selectCustomer(CustomerSelectVO customerSelectVO) throws Exception {
		return getSqlSession().selectList("customerSelectDao.selectCustomer", customerSelectVO);
	}

	@Override
	public List<CustomerSelectVO> detailCustomer(CustomerSelectVO customerSelectVO) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return getSqlSession().selectList("customerSelectDao.detailCustomer", customerSelectVO);
	}
	
}
