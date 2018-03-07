package com.cosmo.estimateNewCar.controller;

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
import com.cosmo.estimateNewCar.service.NewCarSelectService;
import com.cosmo.vo.NewCarSelectVO;

/*
 * naehoon
 * 2018-02-23
 * 新車見積情報選択Controller
 **/

@Controller
public class NewCarSelectController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NewCarSelectService newCarSelectService;

	//初期画面
	@RequestMapping(value="/newCarSelect.do")
	public String newCarSelectView(ModelMap model) throws Exception {
		List<NewCarSelectVO> bodyType = newCarSelectService.selectBodyType(); 
		model.addAttribute("bodyType", bodyType);
		return "EstimateNewCar/newCarSelect";
	}

	//グリッド取得
	@RequestMapping(value = "/newCarSelect.ajax")
	public ModelAndView newCarSelect(@ModelAttribute("newCarSelectVO") NewCarSelectVO newCarSelectVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<NewCarSelectVO> newCarSelect = newCarSelectService.selectNewCar(newCarSelectVO);
		mv.addObject("resultList", newCarSelect);
		return mv;
	}
	
	//ボデー明細	コンボボックス情報取得
	@RequestMapping(value = "/searchBodyDetailCombo.ajax")
	public ModelAndView searchBodyDetailCombo(@ModelAttribute("newCarSelectVO") NewCarSelectVO newCarSelectVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<NewCarSelectVO> bodyTypeDetail = newCarSelectService.selectBodyTypeDetail(newCarSelectVO);
		mv.addObject("bodyTypeDetail", bodyTypeDetail);
		return mv;
	}
	
	//グリッド削除
	@RequestMapping(value = "/deleteNewCar.ajax")
	public ModelAndView deleteNewCar(@ModelAttribute("newCarSelectVO") NewCarSelectVO newCarSelectVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
//		System.out.println("削除 ajax !!!!!!!!!!!" + newCarSelectVO.getEstimatenumber() + " " + newCarSelectVO.getCustomerid());
		int resultCnt = 0;
		resultCnt += newCarSelectService.deleteNewCar(newCarSelectVO);
		resultCnt += newCarSelectService.deleteNewCarDetail(newCarSelectVO);
		mv.addObject("resultCnt", resultCnt);
		return mv;
	}
}
