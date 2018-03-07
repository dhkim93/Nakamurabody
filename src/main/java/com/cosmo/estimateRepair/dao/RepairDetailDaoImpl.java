package com.cosmo.estimateRepair.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.RepairDetailVO;

public class RepairDetailDaoImpl extends SqlSessionDaoSupport implements RepairDetailDao {

	public List<RepairDetailVO> selectRepairDetail(RepairDetailVO repairDetailVO) throws Exception{
		return getSqlSession().selectList("repairDetailDao.selectRepairDetail",repairDetailVO);
	}

	public List<RepairDetailVO> selectManHourKind() throws Exception{
		return getSqlSession().selectList("repairDetailDao.selectManHourKind");
	}

	public String selectLabourCosts() throws Exception {
		return getSqlSession().selectOne("repairDetailDao.selectLabourCosts");
	}

}
