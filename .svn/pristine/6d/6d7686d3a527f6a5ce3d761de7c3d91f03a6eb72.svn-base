package com.cosmo.managementRepair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.managementRepair.dao.PopManagementManhourDao;
import com.cosmo.vo.PopManagementManhourVO;

@Service
public class PopManagementManhourServiceImpl implements PopManagementManhourService{
	
	@Autowired
	private PopManagementManhourDao popManagementManhourDao;
	
//	public void setPopManagementManhourDao(PopManagementManhourDao popManagementManhourDao){
//		this.popManagementManhourDao = popManagementManhourDao;
//	}
	@Override
	public List<PopManagementManhourVO> selectPrice(PopManagementManhourVO manhourSelectPriceVO) throws Exception {
		// TODO Auto-generated method stub
		return popManagementManhourDao.selectPrice(manhourSelectPriceVO);
	}

}
