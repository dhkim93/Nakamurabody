package com.cosmo.estimateRepair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.estimateRepair.dao.RepairSelectDao;
import com.cosmo.vo.RepairSelectVO;

@Service
public class RepairSelectServiceImpl implements RepairSelectService {
	
	@Autowired
	private RepairSelectDao repairSelectDao;
	
	//グリッド取得
	public List<RepairSelectVO> selectRepairCar(RepairSelectVO repairSelectVO) throws Exception {
		return repairSelectDao.selectRepairCar(repairSelectVO);
	}
	
	//ボデータイプコンボボックス情報取得
	public List<RepairSelectVO> selectCarTypeDetail() throws Exception {
		return repairSelectDao.selectCarTypeDetail();
	}
	
	//ボデー明細	コンボボックス情報取得
	public List<RepairSelectVO> selectBodyTypeDetail(RepairSelectVO repairSelectVO) throws Exception {
		return repairSelectDao.selectBodyTypeDetail(repairSelectVO);
	}
	
	//グリッド削除
	public int deleteNewCar(RepairSelectVO repairSelectVO) throws Exception {
		return repairSelectDao.deleteNewCar(repairSelectVO);
	}		
	
	//グリッド削除
	public int deleteNewCarDetail(RepairSelectVO repairSelectVO) throws Exception {
		return repairSelectDao.deleteNewCarDetail(repairSelectVO);
	}			
	
}
