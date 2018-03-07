package com.cosmo.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.employee.dao.EmployeeManagementDao;
import com.cosmo.vo.EmployeeManagementVO;

@Service
public class EmployeeManagementServiceImpl implements EmployeeManagementService{
	
	@Autowired
	private EmployeeManagementDao employeeManagementDao;

//	public void setEmployeeManagementDao(EmployeeManagementDao employeeManagementDao) {
//		this.employeeManagementDao = employeeManagementDao;
//	}

	//なし
	public List<EmployeeManagementVO> selectEmployeeManagement(EmployeeManagementVO employeeManagementVO) throws Exception {
		return employeeManagementDao.selectEmployeeManagement(employeeManagementVO);
	}

	//グリッド取得
	public List<EmployeeManagementVO> selectEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception {
		// TODO Auto-generated method stub
		return employeeManagementDao.selectEmployeeInfo(employeeManagementVO);
	}
	//グリッド削除
	public int deleteEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception {
		return employeeManagementDao.deleteEmployeeInfo(employeeManagementVO);
	}

}
