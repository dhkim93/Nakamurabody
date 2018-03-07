package com.cosmo.employee.dao;

import java.util.List;

import com.cosmo.vo.EmployeeManagementVO;

public interface EmployeeManagementDao {
	//なし
	public List<EmployeeManagementVO> selectEmployeeManagement(EmployeeManagementVO employeeManagementVO) throws Exception;

	//グリッド取得
	public List<EmployeeManagementVO> selectEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;
	
	//グリッド削除
	public int deleteEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;

}
