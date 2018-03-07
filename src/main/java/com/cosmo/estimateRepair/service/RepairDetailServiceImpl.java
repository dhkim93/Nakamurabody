package com.cosmo.estimateRepair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmo.estimateRepair.dao.RepairDetailDao;
import com.cosmo.vo.RepairDetailVO;

@Service
public class RepairDetailServiceImpl implements RepairDetailService {
	
	@Autowired
	private RepairDetailDao ｒepairDetailDao;
	
//	public void setRepairDetailDao(RepairDetailDao ｒepairDetailDao){
//		this.ｒepairDetailDao = ｒepairDetailDao;
//	}

	public List<RepairDetailVO> selectRepairDetail(RepairDetailVO repairDetailVO) throws Exception {
		
		if(repairDetailVO.getTabid().length()==1) {
			repairDetailVO.setTabid("0"+repairDetailVO.getTabid());
		}
		if(repairDetailVO.getMastertype().length()==1) {
			repairDetailVO.setMastertype("0"+repairDetailVO.getMastertype());
		}
		
		return ｒepairDetailDao.selectRepairDetail(repairDetailVO);
	}

	public List<RepairDetailVO> selectManHourKind() throws Exception{
		return ｒepairDetailDao.selectManHourKind();
	}

	//工賃料金取得
	public String selectLabourCosts() throws Exception {
		return ｒepairDetailDao.selectLabourCosts();
	}
}
