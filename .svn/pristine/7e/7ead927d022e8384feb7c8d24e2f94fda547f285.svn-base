package com.cosmo.estimateNewCar.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.cosmo.vo.NewCarSelectVO;

public class NewCarSelectDaoImpl extends SqlSessionDaoSupport implements NewCarSelectDao{

	//グリッド取得
	public List<NewCarSelectVO> selectNewCar(NewCarSelectVO newCarSelectVO) throws Exception {
		return getSqlSession().selectList("newCarSelectDao.selectNewCar", newCarSelectVO);
	}
	
	//ボデータイプコンボボックス情報取得
	public List<NewCarSelectVO> selectBodyType() throws Exception {
		return getSqlSession().selectList("newCarSelectDao.selectBodyType");
	}
	
	//ボデー明細	コンボボックス情報取得
	public List<NewCarSelectVO> selectBodyTypeDetail(NewCarSelectVO newCarSelectVO) throws Exception {
		return getSqlSession().selectList("newCarSelectDao.selectBodyTypeDetail", newCarSelectVO);
	}	
	
	//グリッド削除
	@Transactional
	public int deleteNewCar(NewCarSelectVO newCarSelectVO) throws Exception {
		return getSqlSession().delete("newCarSelectDao.deleteNewCar", newCarSelectVO);
	}	
	
	@Transactional
	public int deleteNewCarDetail(NewCarSelectVO newCarSelectVO) throws Exception {
		return getSqlSession().delete("newCarSelectDao.deleteNewCarDetail", newCarSelectVO);
	}		
	
}
