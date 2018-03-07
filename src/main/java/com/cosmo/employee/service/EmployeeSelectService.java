package com.cosmo.employee.service;

import java.util.List;

import com.cosmo.vo.EmployeeSelectVO;

public interface EmployeeSelectService {

	List<EmployeeSelectVO> selectEmployee(EmployeeSelectVO employeeSelectVO) throws Exception;

	void changePassword(EmployeeSelectVO employeeSelectVO);

	
}
