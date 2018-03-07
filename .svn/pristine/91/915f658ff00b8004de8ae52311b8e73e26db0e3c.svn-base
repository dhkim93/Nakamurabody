package com.cosmo.estimateNewCar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.estimateNewCar.dao.PopEstimateNewCarDetailDao;
import com.cosmo.vo.PopEstimateNewCarDetailVO;

@Service
public class PopEstimateNewCarDetailServiceImpl implements PopEstimateNewCarDetailService {

	@Autowired
	private PopEstimateNewCarDetailDao popEstimateNewCarDetailDao;
	
	public void setPopEstimateNewCarDetailDao(PopEstimateNewCarDetailDao popEstimateNewCarDetailDao){
		this.popEstimateNewCarDetailDao = popEstimateNewCarDetailDao;
	}
	
	//グリッド取得
	public List<PopEstimateNewCarDetailVO> selectPopEstimateNewCarDetail(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception{
		return popEstimateNewCarDetailDao.selectPopEstimateNewCarDetail(popEstimateNewCarDetailVO);
	}
	
	//グリッド削除
	public int deleteNewCar(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception {
		return popEstimateNewCarDetailDao.deleteNewCar(popEstimateNewCarDetailVO);
	}		
	
	//グリッド削除
	public int deleteNewCarDetail(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception {
		return popEstimateNewCarDetailDao.deleteNewCarDetail(popEstimateNewCarDetailVO);
	}			

}
