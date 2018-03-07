package com.cosmo.estimateNewCar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.estimateNewCar.dao.EstimateNewCarDao;
import com.cosmo.vo.EstimateNewCarVO;

@Service
public class EstimateNewCarServiceImpl implements EstimateNewCarService {

	@Autowired
	private EstimateNewCarDao estimateNewCarDao;

//	public void setEstimateNewCarDao(EstimateNewCarDao estimateNewCarDao) {
//		this.estimateNewCarDao = estimateNewCarDao;
//	}

	@Override
	public List<EstimateNewCarVO> selectBodyType() throws Exception {
		return estimateNewCarDao.selectBodyType();
	}

	@Override
	public List<EstimateNewCarVO> searchByBodyType(EstimateNewCarVO estimateNewCarVO) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return estimateNewCarDao.searchByBodyType(estimateNewCarVO);
	}

	@Override
	public List<EstimateNewCarVO> searchTabname(EstimateNewCarVO estimateNewCarVO) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return estimateNewCarDao.searchTabname(estimateNewCarVO);
	}
	
}
