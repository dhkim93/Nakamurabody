package com.cosmo.estimateRepair.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cosmo.customer.HomeController;
import com.cosmo.estimateRepair.service.RepairSelectService;
import com.cosmo.vo.RepairSelectVO;

/*
 * naehoon
 * 2018-02-26
 * 修理見積情報選択Controller
 **/

@Controller
public class RepairSelectController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private RepairSelectService repairSelectService;

	//初期画面
	@RequestMapping(value="/repairSelectView.do")
	public String repairSelectView(ModelMap model) throws Exception {
		List<RepairSelectVO> bodyType = repairSelectService.selectCarTypeDetail(); 
		model.addAttribute("bodyType", bodyType);
		return "EstimateRepair/repairSelect";
	}

	//グリッド取得
	@RequestMapping(value = "/selectRepairCar.ajax")
	public ModelAndView selectRepairCar(@ModelAttribute("repairSelectVO") RepairSelectVO repairSelectVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<RepairSelectVO> repairSelect = repairSelectService.selectRepairCar(repairSelectVO);
		mv.addObject("resultList", repairSelect);
		return mv;
	}
	
	//車輌タイプコンボボックス情報取得
	@RequestMapping(value = "/searchCarTypeCombo.ajax")
	public ModelAndView searchCarDetailCombo(@ModelAttribute("repairSelectVO") RepairSelectVO repairSelectVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<RepairSelectVO> carTypeDetail = repairSelectService.selectCarTypeDetail();
		mv.addObject("carTypeDetail", carTypeDetail);
		return mv;
	}
	
	//グリッド削除
	@RequestMapping(value = "/deleteRepairSelect.ajax")
	public ModelAndView deleteRepairSelect(@ModelAttribute("repairSelectVO") RepairSelectVO repairSelectVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
//		System.out.println("削除 ajax !!!!!!!!!!!" + repairSelectVO.getEstimatenumber() + " " + repairSelectVO.getCustomerid());
		int resultCnt = 0;
//		resultCnt += repairSelectService.deleteNewCar(repairSelectVO);
//		resultCnt += repairSelectService.deleteNewCarDetail(repairSelectVO);
		mv.addObject("resultCnt", resultCnt);
		return mv;
	}
}
