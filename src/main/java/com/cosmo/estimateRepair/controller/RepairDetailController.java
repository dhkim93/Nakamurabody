package com.cosmo.estimateRepair.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cosmo.customer.HomeController;
import com.cosmo.estimateRepair.service.RepairDetailService;
import com.cosmo.vo.RepairDetailVO;

@Controller
public class RepairDetailController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private RepairDetailService repairDetailService;

	@RequestMapping(value = "/repairDetail.do")
	public String getCarType(ModelMap model, @ModelAttribute("repairDetailVO") RepairDetailVO repairDetailVO)
			throws Exception {
		// selectBoxのoptionリスト
		List<RepairDetailVO> manHourKind = repairDetailService.selectManHourKind();
		//工賃料金(作業料金)取得
		repairDetailVO.setLabourCosts(repairDetailService.selectLabourCosts());

		model.addAttribute("manHourKind", manHourKind);
		model.addAttribute("repairDetailVO",repairDetailVO);
		return "EstimateRepair/repairDetail";
	}

	@RequestMapping(value = "/repairDetailTable.ajax")
	public ModelAndView search(ModelMap model,@ModelAttribute("repairDetailVO") RepairDetailVO repairDetailVO)
			throws Exception {
		// テーブルに表示するデータ
		List<RepairDetailVO> repairDetail = repairDetailService.selectRepairDetail(repairDetailVO);
		
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("repairDetail", repairDetail);
		return mv;
	}

	@RequestMapping(value = "/repairDetailResult.do")
	public String result(HttpServletRequest request,ModelMap model, @ModelAttribute("repairDetailVO") RepairDetailVO repairDetailVO)
			throws Exception {
		
		Enumeration<String> parameterNames = request.getParameterNames();
		while(parameterNames.hasMoreElements()) {
			String code = parameterNames.nextElement();
			System.out.println(">>>"+code +" : "+request.getParameter(code) );
		}

		return "EstimateRepair/estimateRepair";
	}
}
