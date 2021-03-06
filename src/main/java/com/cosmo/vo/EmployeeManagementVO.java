package com.cosmo.vo;

import java.util.Date;

public class EmployeeManagementVO {
	String employeeId;
	String employeePassword;
	String employeeName;
	String employeeKana;
	String employeeEnteringDay;
	String employeeLeavingDay;
	String employeeEmail;
	String employeeMobileNumber;
	String employeeDayFrom;//入社日付検索条件
	String employeeDayTo;//退社日付検索条件
	boolean chkResult;//退社チェック
	
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeePassword() {
		return employeePassword;
	}
	public void setEmployeePassword(String employeePassword) {
		this.employeePassword = employeePassword;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeeKana() {
		return employeeKana;
	}
	public void setEmployeeKana(String employeeKana) {
		this.employeeKana = employeeKana;
	}
	
	public String getEmployeeEnteringDay() {
		return employeeEnteringDay;
	}
	public void setEmployeeEnteringDay(String employeeEnteringDay) {
		this.employeeEnteringDay = employeeEnteringDay;
	}
	public String getEmployeeLeavingDay() {
		return employeeLeavingDay;
	}
	public void setEmployeeLeavingDay(String employeeLeavingDay) {
		this.employeeLeavingDay = employeeLeavingDay;
	}
	public String getEmployeeEmail() {
		return employeeEmail;
	}
	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}
	public String getEmployeeMobileNumber() {
		return employeeMobileNumber;
	}
	public void setEmployeeMobileNumber(String employeeMobileNumber) {
		this.employeeMobileNumber = employeeMobileNumber;
	}

	public String getEmployeeDayTo() {
		return employeeDayTo;
	}
	public void setEmployeeDayTo(String employeeDayTo) {
		this.employeeDayTo = employeeDayTo;
	}
	public String getEmployeeDayFrom() {
		return employeeDayFrom;
	}
	public void setEmployeeDayFrom(String employeeDayFrom) {
		this.employeeDayFrom = employeeDayFrom;
	}
	public boolean isChkResult() {
		return chkResult;
	}
	public void setChkResult(boolean chkResult) {
		this.chkResult = chkResult;
	}
	
	
	
}
