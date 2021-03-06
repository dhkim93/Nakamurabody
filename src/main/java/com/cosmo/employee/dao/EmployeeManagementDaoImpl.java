package com.cosmo.employee.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.EmployeeManagementVO;

public class EmployeeManagementDaoImpl extends SqlSessionDaoSupport implements EmployeeManagementDao{
	//なし
	public List<EmployeeManagementVO> selectEmployeeManagement(EmployeeManagementVO employeeManagementVO) throws Exception {
		return getSqlSession().selectList("employeeManagementDao.selectEmployeeManagement", employeeManagementVO);
	}
	//グリッド取得
	public List<EmployeeManagementVO> selectEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception{
		return getSqlSession().selectList("employeeManagementDao.selectEmployeeInfo", employeeManagementVO);
	}
	
	//グリッド削除
	public int deleteEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception{
		return getSqlSession().delete("employeeManagementDao.deleteEmployeeInfo", employeeManagementVO);
	}
}
