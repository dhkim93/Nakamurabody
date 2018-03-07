package com.cosmo.estimateRepair.service;

import java.util.List;

import com.cosmo.vo.EstimateRepairVO;

public interface EstimateRepairService {
	
	List<EstimateRepairVO> selectAllCarType() throws Exception;

	List<EstimateRepairVO> selectEstimateInfo(EstimateRepairVO estimateRepairVO) throws Exception;
	
}
