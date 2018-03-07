package com.cosmo.managementNewCar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cosmo.managementNewCar.service.PopManagementNewCarBodyService;
import com.cosmo.vo.PopManagementNewCarBodyVO;

@Controller
public class PopManagementNewCarBodyController {

	// DBの既存データ
	static List<PopManagementNewCarBodyVO> beforeData;

	@Autowired
	private PopManagementNewCarBodyService popManagementNewCarBodyService;

	//viewを呼出し
	@RequestMapping(value = "/popManageNewCarBody.do")
	public String newCarBodyView(ModelMap model) throws Exception {
		return "ManagementNewCar/popManagementNewCarBody";
	}

	// DBの既存データ取得
	@RequestMapping(value = "/popManageNewCarBodyList.ajax")
	public ModelAndView newCarBodyViewList(
			@ModelAttribute("popManagementNewCarBodyVO") PopManagementNewCarBodyVO managementNewCarBodyVO,
			ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		beforeData = popManagementNewCarBodyService.selectNewCarBody(managementNewCarBodyVO);
		mv.addObject("resultList", beforeData);
		return mv;
	}

	// 保存ボタン押下場合
	@RequestMapping(value = "/popManageNewCarBodySave.ajax")
	public ModelAndView newCarBodySave(@RequestParam(value = "jsonData") String jsonData) throws Exception {
		System.out.println("-----------------------保存ボタン押下場合--------------------------");
		ModelAndView mv = new ModelAndView("jsonView");
		System.out.println(jsonData);
		popManagementNewCarBodyService.updateNewCarBody(beforeData, jsonData);
		return mv;
	}

	// @RequestMapping(value = "/popManageNewCarBody.ajax")
	// public ModelAndView search(ModelMap model,
	// @ModelAttribute("popManagementNewCarBodyVO") PopManagementNewCarBodyVO
	// managementNewCarBodyVO)
	// throws Exception {
	// List<PopManagementNewCarBodyVO> data =
	// popManagementNewCarBodyService.selectNewCarBody(managementNewCarBodyVO);
	// ModelAndView mv = new ModelAndView("jsonView");
	// mv.addObject("aaa", data);
	// return mv;
	// }

	// @RequestMapping(value = "/newCarSelect.ajax")
	// public ModelAndView newCarSelect(@ModelAttribute("newCarSelectVO")
	// NewCarSelectVO newCarSelectVO, ModelMap model)
	// throws Exception {
	// System.out.println("ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	// ModelAndView mv = new ModelAndView("jsonView");
	// List<NewCarSelectVO> newCarSelect =
	// newCarSelectService.selectNewCar(newCarSelectVO);
	// mv.addObject("resultList", newCarSelect);
	// return mv;
	// }

}
