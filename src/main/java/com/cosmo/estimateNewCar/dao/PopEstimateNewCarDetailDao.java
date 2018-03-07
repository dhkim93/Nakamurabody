package com.cosmo.estimateNewCar.dao;

import java.util.List;

import com.cosmo.vo.PopEstimateNewCarDetailVO;

public interface PopEstimateNewCarDetailDao{
	//グリッド取得
	public List<PopEstimateNewCarDetailVO> selectPopEstimateNewCarDetail(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception;
	
	//グリッド削除
	public int deleteNewCar(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception;

	//グリッド削除
	public int deleteNewCarDetail(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception;
	
}
