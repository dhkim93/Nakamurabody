package com.cosmo.managementRepair.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.PopManagementManhourVO;
import com.cosmo.vo.PopManagementVehicleVO;

public class PopManagementVehicleDaoImpl extends SqlSessionDaoSupport implements PopManagementVehicleDao {

	@Override
	public List<PopManagementVehicleVO> selectAllConstmaster(PopManagementVehicleVO managementVehicleVO) throws Exception {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("popManagementVehicleDao.selectAllConstmaster", managementVehicleVO);
	}

}
