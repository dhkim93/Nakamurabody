package com.cosmo.managementNewCar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmo.managementNewCar.service.PopManagementNewCarBodyService;
import com.cosmo.vo.PopManagementNewCarBodyVO;

@Controller
public class EstimateManagementNewCar {
	
	@Autowired
	private PopManagementNewCarBodyService popManagementNewCarBodyService;

	@RequestMapping(value = "/estimateManagementNewCar.do")
	public String newCarBodyView(
			@ModelAttribute("popManagementNewCarBodyVO") PopManagementNewCarBodyVO managementNewCarBodyVO,
			ModelMap model) throws Exception {

		List<PopManagementNewCarBodyVO> data = popManagementNewCarBodyService.selectNewCarBody(managementNewCarBodyVO);
		model.addAttribute("list", data);
		return "ManagementNewCar/estimateManagementNewCar";
	}

}
