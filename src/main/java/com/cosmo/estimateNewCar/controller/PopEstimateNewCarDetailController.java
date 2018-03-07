package com.cosmo.estimateNewCar.controller;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cosmo.estimateNewCar.service.PopEstimateNewCarDetailService;
import com.cosmo.vo.NewCarSelectVO;
import com.cosmo.vo.PopEstimateNewCarDetailVO;

/*
 * naehoon
 * 2018-02-23
 * 新車見積詳細 Controller
 **/

@Controller
public class PopEstimateNewCarDetailController {

	@Autowired
	private PopEstimateNewCarDetailService popEstimateNewCarDetailService;
	
	//初期画面
	@RequestMapping(value="/popEstimateNewCarDetail.do" , method = RequestMethod.GET)
	public String popEstimateNewCarDetail(@ModelAttribute("popEstimateNewCarDetailVO") PopEstimateNewCarDetailVO popEstimateNewCarDetailVO, ModelMap model) throws Exception {
		List<PopEstimateNewCarDetailVO> EstimateNewCarDetail = popEstimateNewCarDetailService.selectPopEstimateNewCarDetail(popEstimateNewCarDetailVO);
		String json = new ObjectMapper().writeValueAsString(EstimateNewCarDetail);
		model.addAttribute("EstimateNewCarDetail", EstimateNewCarDetail);
		model.addAttribute("EstimateNewCarDetailJson", json);
		return "EstimateNewCar/popEstimateNewCarDetail";
	}	
	
	//グリッド削除
	@RequestMapping(value = "/deleteNewCarDetail.ajax")
	public ModelAndView deleteNewCarDetail(@ModelAttribute("popEstimateNewCarDetailVO") PopEstimateNewCarDetailVO popEstimateNewCarDetailVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		int resultCnt = 0;
		resultCnt += popEstimateNewCarDetailService.deleteNewCar(popEstimateNewCarDetailVO);
		resultCnt += popEstimateNewCarDetailService.deleteNewCarDetail(popEstimateNewCarDetailVO);
		mv.addObject("resultCnt", resultCnt);
		return mv;
	}
	
}
