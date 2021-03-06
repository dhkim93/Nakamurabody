package com.cosmo.estimateNewCar.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.cosmo.vo.NewCarSelectVO;
import com.cosmo.vo.PopEstimateNewCarDetailVO;

public class PopEstimateNewCarDetailDaoImpl extends SqlSessionDaoSupport implements PopEstimateNewCarDetailDao{
	
	public List<PopEstimateNewCarDetailVO> selectPopEstimateNewCarDetail(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception{
		return getSqlSession().selectList("popEstimateNewCarDetailDao.selectPopEstimateNewCarDetail", popEstimateNewCarDetailVO);
	}
	
	//グリッド削除1
	@Transactional
	public int deleteNewCar(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception {
		return getSqlSession().delete("popEstimateNewCarDetailDao.deleteNewCar", popEstimateNewCarDetailVO);
	}	
	
	//グリッド削除2
	@Transactional
	public int deleteNewCarDetail(PopEstimateNewCarDetailVO popEstimateNewCarDetailVO) throws Exception {
		return getSqlSession().delete("popEstimateNewCarDetailDao.deleteNewCarDetail", popEstimateNewCarDetailVO);
	}		
	
}
