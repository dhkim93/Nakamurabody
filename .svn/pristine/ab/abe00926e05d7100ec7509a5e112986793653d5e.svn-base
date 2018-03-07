package com.cosmo.managementRepair.controller;

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
import com.cosmo.managementRepair.service.PopManagementVehicleService;
import com.cosmo.vo.PopManagementManhourVO;
import com.cosmo.vo.PopManagementVehicleVO;
import com.cosmo.vo.NewCarSelectVO;

@Controller
public class PopManagementRepairDetailController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PopManagementVehicleService popManagementVehicleService;

	@RequestMapping(value = "/popManagementRepairDetail.do")
	public String PopManagementVehicleView(ModelMap model) throws Exception {
		List<PopManagementVehicleVO> selectAllConstmaster = popManagementVehicleService.selectAllConstmaster(new PopManagementVehicleVO());
		model.addAttribute("newCarSelect", selectAllConstmaster);
		return "ManagementRepair/popManagementRepairDetail";
	}

	@RequestMapping(value = "/popManagementRepairDetail.ajax")
	public ModelAndView PopManagementVehicle(@ModelAttribute("newCarSelectVO") NewCarSelectVO newCarSelectVO,
			ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("View");
		List<PopManagementVehicleVO> newCarSelect = popManagementVehicleService.selectAllConstmaster(new PopManagementVehicleVO());
		mv.addObject("resultList", newCarSelect);
		return mv;
	}
}
