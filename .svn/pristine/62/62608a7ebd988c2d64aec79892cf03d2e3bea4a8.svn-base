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
import com.cosmo.managementRepair.service.PopManagementManhourService;
import com.cosmo.vo.PopManagementManhourVO;
import com.cosmo.vo.NewCarSelectVO;

@Controller
public class PopManagementManhourController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PopManagementManhourService popManagementManhourService;

	@RequestMapping(value = "/popManagementManhour.do")
	public String PopManagementManhourView(ModelMap model) throws Exception {
		List<PopManagementManhourVO> selectPrice = popManagementManhourService.selectPrice(new PopManagementManhourVO());
		model.addAttribute("selectPrice", selectPrice);
		return "ManagementRepair/popManagementManhour";
	}

	@RequestMapping(value = "/popManagementManhour.ajax")
	public ModelAndView PopManagementManhour(@ModelAttribute("popManagementManhourVO") PopManagementManhourVO popManagementManhourVO,
			ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("View");
		List<PopManagementManhourVO> newCarSelect = popManagementManhourService.selectPrice(new PopManagementManhourVO());
		mv.addObject("resultList", newCarSelect);
		return mv;
	}
}
