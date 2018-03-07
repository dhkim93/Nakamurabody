package com.cosmo.estimateRepair.dao;

import java.util.List;

import com.cosmo.vo.RepairSelectVO;

public interface RepairSelectDao{
	
	//グリッド取得
	public List<RepairSelectVO> selectRepairCar(RepairSelectVO repairSelectVO) throws Exception;
	
	//ボデータイプコンボボックス置取得
	public List<RepairSelectVO> selectCarTypeDetail() throws Exception;
	
	//ボデー明細	コンボボックス情報取得
	public List<RepairSelectVO> selectBodyTypeDetail(RepairSelectVO repairSelectVO) throws Exception;
	
	//グリッド削除
	public int deleteNewCar(RepairSelectVO repairSelectVO) throws Exception;

	//グリッド削除
	public int deleteNewCarDetail(RepairSelectVO repairSelectVO) throws Exception;	
	
}
