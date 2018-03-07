package com.cosmo.estimateRepair.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.cosmo.vo.RepairSelectVO;

public class RepairSelectDaoImpl extends SqlSessionDaoSupport implements RepairSelectDao{
	
	//グリッド取得
	public List<RepairSelectVO> selectRepairCar(RepairSelectVO repairSelectVO) throws Exception {
		return getSqlSession().selectList("repairSelectDao.selectRepairCar", repairSelectVO);
	}
	
	//ボデータイプコンボボックス情報取得
	public List<RepairSelectVO> selectCarTypeDetail() throws Exception {
		return getSqlSession().selectList("repairSelectDao.selectCarTypeDetail");
	}
	
	//ボデー明細	コンボボックス情報取得
	public List<RepairSelectVO> selectBodyTypeDetail(RepairSelectVO repairSelectVO) throws Exception {
		return getSqlSession().selectList("repairSelectDao.selectBodyTypeDetail", repairSelectVO);
	}	
	
	//グリッド削除
	@Transactional
	public int deleteNewCar(RepairSelectVO repairSelectVO) throws Exception {
		return getSqlSession().delete("repairSelectDao.deleteNewCar", repairSelectVO);
	}	
	
	@Transactional
	public int deleteNewCarDetail(RepairSelectVO repairSelectVO) throws Exception {
		return getSqlSession().delete("repairSelectDao.deleteNewCarDetail", repairSelectVO);
	}		
	
}
