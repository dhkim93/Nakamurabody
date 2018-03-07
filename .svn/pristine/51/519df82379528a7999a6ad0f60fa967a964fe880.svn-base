package com.cosmo.employee.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.EmployeeSelectVO;

public class EmployeeSelectDaoImpl extends SqlSessionDaoSupport implements EmployeeSelectDao {

	@Override
	public List<EmployeeSelectVO> selectEmployee(EmployeeSelectVO employeeSelectVO) throws Exception {
		return getSqlSession().selectList("employeeSelectDao.selectEmployee", employeeSelectVO);
	}

	@Override
	public void changePassword(EmployeeSelectVO employeeSelectVO) {
		getSqlSession().selectList("employeeSelectDao.changePassword", employeeSelectVO);
	}

}
