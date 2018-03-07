package com.cosmo.estimateRepair.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cosmo.customer.HomeController;
import com.cosmo.estimateRepair.service.EstimateRepairService;
import com.cosmo.vo.EstimateRepairVO;

@Controller
@SessionAttributes("allNewCarType") 
public class EstimateRepairController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EstimateRepairService estimateRepairService;

	@RequestMapping(value = "/estimateRepair.do")
	public String getCarType(ModelMap model) throws Exception {
		List<EstimateRepairVO> allNewCarType = estimateRepairService.selectAllCarType(); 
		model.addAttribute("allNewCarType", allNewCarType);
		return "EstimateRepair/estimateRepair";
	}

	@RequestMapping(value = "/estimateRepairSearch.ajax")
	public ModelAndView search(ModelMap model,@ModelAttribute("estimateRepairVO")EstimateRepairVO estimateRepairVO) throws Exception{
		List<EstimateRepairVO> estimateInfo = estimateRepairService.selectEstimateInfo(estimateRepairVO);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("dataList", estimateInfo);
		return mv;
	}

}
