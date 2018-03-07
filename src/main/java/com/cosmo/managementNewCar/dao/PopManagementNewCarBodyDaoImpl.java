package com.cosmo.managementNewCar.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cosmo.vo.PopManagementNewCarBodyVO;

public class PopManagementNewCarBodyDaoImpl extends SqlSessionDaoSupport implements PopManagementNewCarBodyDao {

	@Override
	public List<PopManagementNewCarBodyVO> selectNewCarBody(PopManagementNewCarBodyVO managementNewCarBodyVO)
			throws Exception {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("popManagementNewCarBodyDao.select", managementNewCarBodyVO);
	}
	
	@Override
	public void deleteNewCarBody(HashMap<String, String> data) {
		// TODO Auto-generated method stub
		String combotype ="";
		
		Iterator iterator = data.entrySet().iterator();
		while(iterator.hasNext()) {
			Entry entry = (Entry) iterator.next();
			combotype = (String) entry.getKey();
			getSqlSession().delete("popManagementNewCarBodyDao.delete", combotype);
		}
		
	}
	
	@Override
	public void insertNewCarBody(HashMap<String, String> data) throws Exception {
		// TODO Auto-generated method stub
		String combotype = "";
		String comboname = "";
		HashMap<String, String> map = new HashMap<String,String>();
		
		Iterator iterator = data.entrySet().iterator();
		while(iterator.hasNext()) {
			Entry entry = (Entry) iterator.next();
			combotype = (String) entry.getKey();
			comboname = (String) entry.getValue();
			System.out.println(combotype+"::"+comboname);
			map.put("combotype", combotype);
			map.put("comboname", comboname);
			getSqlSession().insert("popManagementNewCarBodyDao.insert",map);
		}
	}
	
	@Override
	public void updateNewCarBody(HashMap<String,String>data) throws Exception {
		// TODO Auto-generated method stub
		
		String combotype = "";
		String comboname = "";
		HashMap<String, String> map = new HashMap<String,String>();
		
		Iterator iterator = data.entrySet().iterator();
		while(iterator.hasNext()) {
			Entry entry = (Entry) iterator.next();
			combotype = (String) entry.getKey();
			comboname = (String) entry.getValue();
			System.out.println(combotype+"::"+comboname);
			map.put("combotype", combotype);
			map.put("comboname", comboname);
			getSqlSession().update("popManagementNewCarBodyDao.update",map);
		}
	}

	@Override
	public List<PopManagementNewCarBodyVO> selectNewCarUnit(PopManagementNewCarBodyVO managementNewCarBodyVO)
			throws Exception {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("popManagementNewCarBodyDao.selectManageNewCarUnit", managementNewCarBodyVO);
	}
	
	
}
