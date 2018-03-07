package com.cosmo.managementRepair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.managementRepair.dao.PopManagementVehicleDao;
import com.cosmo.vo.PopManagementVehicleVO;

@Service
public class PopManagementVehicleServiceImpl implements PopManagementVehicleService{
@Autowired
private PopManagementVehicleDao popManagementVehicleDao;
	
//
//	public void setPopManagementVehicleDao(PopManagementVehicleDao popManagementVehicleDao){
//		this.popManagementVehicleDao = popManagementVehicleDao;
//	}
	@Override
	public List<PopManagementVehicleVO> selectAllConstmaster(PopManagementVehicleVO managementVehicleVO) throws Exception {
		// TODO Auto-generated method stub
		return popManagementVehicleDao.selectAllConstmaster(managementVehicleVO);
	}

}
