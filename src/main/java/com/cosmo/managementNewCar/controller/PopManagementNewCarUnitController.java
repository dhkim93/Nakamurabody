package com.cosmo.managementNewCar.controller;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmo.managementNewCar.service.PopManagementNewCarBodyService;
import com.cosmo.vo.PopManagementNewCarBodyVO;

@Controller
public class PopManagementNewCarUnitController {

	@Autowired
	private PopManagementNewCarBodyService popManagementNewCarBodyService;

	@RequestMapping(value = "/popManageNewCarUnit.do")
	public String newCarUnitView(
			@ModelAttribute("popManagementNewCarBodyVO") PopManagementNewCarBodyVO managementNewCarBodyVO,
			ModelMap model) throws Exception {

		List<PopManagementNewCarBodyVO> data = popManagementNewCarBodyService.selectNewCarUnit(managementNewCarBodyVO);
		String json = new ObjectMapper().writeValueAsString(data);
		model.addAttribute("list", json);
		return "ManagementNewCar/popManagementNewCarUnit";
	}
	
}
