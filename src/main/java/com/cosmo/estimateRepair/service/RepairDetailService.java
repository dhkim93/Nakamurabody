package com.cosmo.estimateRepair.service;

import java.util.List;

import com.cosmo.vo.RepairDetailVO;

public interface RepairDetailService {

	List<RepairDetailVO> selectRepairDetail(RepairDetailVO repairDetailVO) throws Exception;

	List<RepairDetailVO> selectManHourKind() throws Exception;

	String selectLabourCosts() throws Exception;

}
