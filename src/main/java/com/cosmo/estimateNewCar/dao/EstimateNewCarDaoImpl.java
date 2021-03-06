package com.cosmo.estimateNewCar.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.EstimateNewCarVO;

public class EstimateNewCarDaoImpl extends SqlSessionDaoSupport implements EstimateNewCarDao {

	@Override
	public List<EstimateNewCarVO> selectBodyType() {
		return getSqlSession().selectList("estimateNewCarDao.selectBodyType");
	}

	@Override
	public List<EstimateNewCarVO> searchByBodyType(EstimateNewCarVO estimateNewCarVO) {
		// TODO 自動生成されたメソッド・スタブ
		return getSqlSession().selectList("estimateNewCarDao.searchByBodyType", estimateNewCarVO);
	}

	@Override
	public List<EstimateNewCarVO> searchTabname(EstimateNewCarVO estimateNewCarVO) {
		// TODO 自動生成されたメソッド・スタブ
		return getSqlSession().selectList("estimateNewCarDao.searchTabname", estimateNewCarVO);
	}

}
