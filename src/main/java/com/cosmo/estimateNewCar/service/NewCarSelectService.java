package com.cosmo.estimateNewCar.service;

import java.util.List;

import com.cosmo.vo.NewCarSelectVO;

public interface NewCarSelectService {
	
	//グリッド取得
	List<NewCarSelectVO> selectNewCar(NewCarSelectVO newCarSelectVO) throws Exception;
	
	//ボデータイプコンボボックス情報取得
	List<NewCarSelectVO> selectBodyType() throws Exception;
	
	//ボデー明細	コンボボックス情報取得
	List<NewCarSelectVO> selectBodyTypeDetail(NewCarSelectVO newCarSelectVO) throws Exception;
	
	//グリッド削除
	int deleteNewCar(NewCarSelectVO newCarSelectVO) throws Exception;
	
	//グリッド削除
	int deleteNewCarDetail(NewCarSelectVO newCarSelectVO) throws Exception;	
	
}
