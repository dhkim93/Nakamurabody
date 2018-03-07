package com.cosmo.managementNewCar.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmo.vo.PopManagementNewCarBodyVO;

@Controller
public class PopManagementNewCarOptionController {

	@RequestMapping(value = "/popManageNewCarOption.do")
	public String newCarOptionView(
			@ModelAttribute("popManagementNewCarBodyVO") PopManagementNewCarBodyVO managementNewCarBodyVO,
			ModelMap model) throws Exception {

//		List<PopManagementNewCarBodyVO> data = popManagementNewCarBodyService.selectNewCarBody(managementNewCarBodyVO);
//		model.addAttribute("list", data);
		return "ManagementNewCar/popManagementNewCarOption";
	}

	
}
