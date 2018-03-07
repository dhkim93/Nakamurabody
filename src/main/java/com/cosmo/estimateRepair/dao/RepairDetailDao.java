package com.cosmo.estimateRepair.dao;

import java.util.List;

import com.cosmo.vo.RepairDetailVO;

public interface RepairDetailDao {

	public List<RepairDetailVO> selectRepairDetail(RepairDetailVO repairDetailVO) throws Exception;

	public List<RepairDetailVO> selectManHourKind() throws Exception;

	public String selectLabourCosts() throws Exception;

}
