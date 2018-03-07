package com.cosmo.estimateRepair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.estimateRepair.dao.EstimateRepairDao;
import com.cosmo.vo.EstimateRepairVO;

@Service
public class EstimateRepairServiceImpl implements EstimateRepairService{
	
	@Autowired
	private EstimateRepairDao estimateRepairDao;
//	
//	public void setEstimateRepairDao(EstimateRepairDao estimateRepairDao) {
//		this.estimateRepairDao = estimateRepairDao;
//	}

	public List<EstimateRepairVO> selectAllCarType() throws Exception {
		return estimateRepairDao.selectAllCarType();
	}

	public List<EstimateRepairVO> selectEstimateInfo(EstimateRepairVO estimateRepairVO) throws Exception {
		return estimateRepairDao.selectEstimateInfo(estimateRepairVO);
	}

}
