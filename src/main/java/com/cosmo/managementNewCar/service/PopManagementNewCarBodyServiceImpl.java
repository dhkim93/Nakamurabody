package com.cosmo.managementNewCar.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.managementNewCar.dao.PopManagementNewCarBodyDao;
import com.cosmo.vo.PopManagementNewCarBodyVO;

@Service
public class PopManagementNewCarBodyServiceImpl implements PopManagementNewCarBodyService {

	@Autowired
	private PopManagementNewCarBodyDao popManagementNewCarBodyDao;

	@Override
	public List<PopManagementNewCarBodyVO> selectNewCarBody(PopManagementNewCarBodyVO managementNewCarBodyVO)
			throws Exception {
		// TODO Auto-generated method stub
		return popManagementNewCarBodyDao.selectNewCarBody(managementNewCarBodyVO);
	}

	@Override
	public List<PopManagementNewCarBodyVO> selectNewCarUnit(PopManagementNewCarBodyVO managementNewCarBodyVO)
			throws Exception {
		// TODO Auto-generated method stub
		return popManagementNewCarBodyDao.selectNewCarUnit(managementNewCarBodyVO);
	}

//	@Override
//	public void deleteNewCarBody(String comboname) throws Exception {
//		// TODO Auto-generated method stub
//		popManagementNewCarBodyDao.deleteNewCarBody(comboname);
//
//	}

	@Override
	public void updateNewCarBody(List<PopManagementNewCarBodyVO> beforeData, String gridData) throws Exception {
		// TODO Auto-generated method stub

		//画面の表にあるデータ情報取得
		String info = "{\"data\":" + gridData + "}";
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(info);
		JSONArray afterData = (JSONArray) jsonObject.get("data");

		System.out.println("***************data***************");
		for (int j = 0; j < afterData.size(); j++) {
			System.out.println("data = " + j);
			JSONObject rowObject = (JSONObject) afterData.get(j);
			System.out.println("combotype : " + rowObject.get("combotype"));
			System.out.println("comboname : " + rowObject.get("comboname"));
		}
		System.out.println("*************************************");

		//更新、追加、削除　HashMap宣言
		HashMap<String, String> newData = new HashMap<String, String>();
		HashMap<String, String> editData = new HashMap<String, String>();
		HashMap<String, String> deleteData = new HashMap<String, String>();

		//画面の表にあるデータをセット
		for (int i = 0; i < afterData.size(); i++) {
			JSONObject rowObject = (JSONObject) afterData.get(i);
			String afterCombotype = (String) rowObject.get("combotype");
			String afterComboname = (String) rowObject.get("comboname");
			newData.put(afterCombotype, afterComboname);
		}

		//ＤＢにある既存データと比較
		for (int i = 0; i < beforeData.size(); i++) {
			String beforeCombotype = beforeData.get(i).getCombotype();
			String beforeComboname = beforeData.get(i).getComboname();

			//画面票にあるcombotype中にＤＢデータcombotypeがある場合
			if (newData.containsKey(beforeCombotype)) {
				//combonameが異なる場合、修正判断
				if (!newData.get(beforeCombotype).equals(beforeComboname)) {
					editData.put(beforeCombotype, newData.get(beforeCombotype));
					newData.remove(beforeCombotype);
				}else {
					//combonameが同じ場合、新データがない
					newData.remove(beforeCombotype);
				}
			} else {
				//画面票にあるcombotype中にＤＢデータcombotypeがない場合
				//削除
				deleteData.put(beforeCombotype, beforeComboname);
			}
		}
		
		//DAO 実行
		popManagementNewCarBodyDao.deleteNewCarBody(deleteData);
		popManagementNewCarBodyDao.updateNewCarBody(editData);
		popManagementNewCarBodyDao.insertNewCarBody(newData);
		
//		Iterator edititerator = editData.entrySet().iterator();
//		Iterator newiterator = newData.entrySet().iterator();
//		Iterator deleteiterator = deleteData.entrySet().iterator();
//
//		System.out.println("editData------------------------------------ ");
//		while (edititerator.hasNext()) {
//			Entry entry = (Entry) edititerator.next();
//			System.out.println("editData Key: " + entry.getKey() + ", Value: " + entry.getValue());
//		}
//		
//		System.out.println("newData------------------------------------ ");
//		while (newiterator.hasNext()) {
//			Entry entry = (Entry) newiterator.next();
//			System.out.println("newData Key: " + entry.getKey() + ", Value: " + entry.getValue());
//		}
//
//		System.out.println("deleteData------------------------------------ ");
//		while (deleteiterator.hasNext()) {
//			Entry entry = (Entry) deleteiterator.next();
//			System.out.println("deleteData Key: " + entry.getKey() + ", Value: " + entry.getValue());
//		}

	}

}
