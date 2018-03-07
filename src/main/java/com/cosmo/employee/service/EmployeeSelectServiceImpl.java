package com.cosmo.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.employee.dao.EmployeeSelectDao;
import com.cosmo.vo.EmployeeSelectVO;

@Service
public class EmployeeSelectServiceImpl implements EmployeeSelectService {

	@Autowired
	private EmployeeSelectDao employeeSelectDao;

//	public void setEmployeeSelectDao(EmployeeSelectDao employeeSelectDao) {
//		this.employeeSelectDao = employeeSelectDao;
//	}

	@Override
	public List<EmployeeSelectVO> selectEmployee(EmployeeSelectVO employeeSelectVO) throws Exception {
		return employeeSelectDao.selectEmployee(employeeSelectVO);
	}

	@Override
	public void changePassword(EmployeeSelectVO employeeSelectVO) {
		employeeSelectDao.changePassword(employeeSelectVO);
	}

}
