package com.cosmo.employee.dao;

import java.util.List;

import com.cosmo.vo.EmployeeManagementVO;

public interface PopManagementEmployeeDao {
	// 該当ユーザ情報取得
	public List<EmployeeManagementVO> selectPopEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;

	// グリッド削除
	public int deletePopEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;

	// ユーザ情報更新
	public int updatePopEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;

	// ユーザ情報登録
	public int insertPopEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;

	// パスワードを初期化
	public int resetPopEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;

	// 重複チェック
	public List<EmployeeManagementVO> duplicatePopEmployeeInfo(EmployeeManagementVO employeeManagementVO) throws Exception;
	

}
