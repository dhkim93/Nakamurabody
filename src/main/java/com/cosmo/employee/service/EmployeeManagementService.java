package com.cosmo.employee.service;

import java.util.List;

import com.cosmo.vo.EmployeeManagementVO;

public interface EmployeeManagementService {
	//なし
	List<EmployeeManagementVO> selectEmployeeManagement(EmployeeManagementVO employeeManagementVO) throws Exception;

	//グリッド取得
	List<EmployeeManagementVO> selectEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;
	
	//グリッド削除
	int deleteEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;
}
