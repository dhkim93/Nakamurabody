package com.cosmo.managementRepair.dao;

import java.util.List;

import com.cosmo.vo.PopManagementManhourVO;

public interface PopManagementManhourDao {
	public List<PopManagementManhourVO> selectPrice(PopManagementManhourVO manhourSelectPriceVO) throws Exception;
}
