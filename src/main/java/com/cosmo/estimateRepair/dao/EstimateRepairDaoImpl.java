package com.cosmo.estimateRepair.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.EstimateRepairVO;

public class EstimateRepairDaoImpl extends SqlSessionDaoSupport implements EstimateRepairDao{

	public List<EstimateRepairVO> selectAllCarType() throws Exception{
		return getSqlSession().selectList("estimateRepairDao.selectAllCarType");
	}

	public List<EstimateRepairVO> selectEstimateInfo(EstimateRepairVO estimateRepairVO) throws Exception {
		return getSqlSession().selectList("estimateRepairDao.selectEstimateInfo",estimateRepairVO);
	}
}
