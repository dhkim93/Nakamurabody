package com.cosmo.vo;

public class NewCarSelectVO {
	
	private String mastertype = "";					//CONSTMASTER(ボデータイプ取得用)
	private String combotype = "";					//CONSTMASTER(ボデータイプ取得用)
	private String comboname = "";					//CONSTMASTER(ボデータイプ取得用)
	private String inputtype = "";						//CONSTMASTER(ボデータイプ取得用)
	private String estimatenumber ="";     		//見積番号
	private String customerid ="";					//顧客ID
	private String customername ="";				//顧客名
	private String customerkana ="";				//顧客名(カナ)
	private String bodytype ="";						//ボデータイプ
	private String bodyname ="";						//ボデー名
	private String bodyspecname ="";				//仕様項目
	private String estimateemployeeid ="";		//見積担当者ID
	private String estimateemployeename ="";	//見積担当者明
	private String estimateemployeekana ="";    //見積担当者明(カナ)
	private String estimateday;						//見積日
	private String estimatedayfrom;					//見積日(検索条件)
	private String estimatedayto;					//見積日(検索条件)
	private String remarks ="";						//備考
	private String specdetail="";						//ボデータイプ詳細
	private String estimatemoney;					//見積金額
	private String estimatemoneyfrom;				//見積金額(検索条件)
	private String estimatemoneyto;				//見積金額(検索条件)
	
	public String getEstimateday() {
		return estimateday;
	}
	public void setEstimateday(String estimateday) {
		this.estimateday = estimateday;
	}
	public String getEstimatedayfrom() {
		return estimatedayfrom;
	}
	public void setEstimatedayfrom(String estimatedayfrom) {
		this.estimatedayfrom = estimatedayfrom;
	}
	public String getEstimatedayto() {
		return estimatedayto;
	}
	public void setEstimatedayto(String estimatedayto) {
		this.estimatedayto = estimatedayto;
	}
	public String getEstimatemoneyfrom() {
		return estimatemoneyfrom;
	}
	public void setEstimatemoneyfrom(String estimatemoneyfrom) {
		this.estimatemoneyfrom = estimatemoneyfrom;
	}
	public String getEstimatemoneyto() {
		return estimatemoneyto;
	}
	public void setEstimatemoneyto(String estimatemoneyto) {
		this.estimatemoneyto = estimatemoneyto;
	}
	public String getCustomerkana() {
		return customerkana;
	}
	public void setCustomerkana(String customerkana) {
		this.customerkana = customerkana;
	}
	public String getSpecdetail() {
		return specdetail;
	}
	public void setSpecdetail(String specdetail) {
		this.specdetail = specdetail;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getEstimatenumber() {
		return estimatenumber;
	}
	public void setEstimatenumber(String estimatenumber) {
		this.estimatenumber = estimatenumber;
	}
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	public String getBodytype() {
		return bodytype;
	}
	public void setBodytype(String bodytype) {
		this.bodytype = bodytype;
	}
	public String getBodyname() {
		return bodyname;
	}
	public void setBodyname(String bodyname) {
		this.bodyname = bodyname;
	}
	public String getBodyspecname() {
		return bodyspecname;
	}
	public void setBodyspecname(String bodyspecname) {
		this.bodyspecname = bodyspecname;
	}
	public String getEstimatemoney() {
		return estimatemoney;
	}
	public void setEstimatemoney(String estimatemoney) {
		this.estimatemoney = estimatemoney;
	}
	public String getEstimateemployeeid() {
		return estimateemployeeid;
	}
	public void setEstimateemployeeid(String estimateemployeeid) {
		this.estimateemployeeid = estimateemployeeid;
	}
	public String getEstimateemployeename() {
		return estimateemployeename;
	}
	public void setEstimateemployeename(String estimateemployeename) {
		this.estimateemployeename = estimateemployeename;
	}
	public String getEstimateemployeekana() {
		return estimateemployeekana;
	}
	public void setEstimateemployeekana(String estimateemployeekana) {
		this.estimateemployeekana = estimateemployeekana;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getMastertype() {
		return mastertype;
	}
	public void setMastertype(String mastertype) {
		this.mastertype = mastertype;
	}
	public String getCombotype() {
		return combotype;
	}
	public void setCombotype(String combotype) {
		this.combotype = combotype;
	}
	public String getComboname() {
		return comboname;
	}
	public void setComboname(String comboname) {
		this.comboname = comboname;
	}
	public String getInputtype() {
		return inputtype;
	}
	public void setInputtype(String inputtype) {
		this.inputtype = inputtype;
	}
}
