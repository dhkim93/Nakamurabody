package com.cosmo.managementRepair.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.PopManagementManhourVO;
import com.cosmo.vo.NewCarSelectVO;

public class PopManagementManhourDaoImpl extends SqlSessionDaoSupport implements PopManagementManhourDao {

	@Override
	public List<PopManagementManhourVO> selectPrice(PopManagementManhourVO manhourSelectPriceVO) throws Exception {
		return getSqlSession().selectList("popManagementManhourDao.PopManagementManhourSelectPrice", manhourSelectPriceVO);
	}
}
