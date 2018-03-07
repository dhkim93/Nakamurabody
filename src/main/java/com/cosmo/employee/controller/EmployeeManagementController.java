package com.cosmo.employee.controller;

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
import com.cosmo.employee.service.EmployeeManagementService;
import com.cosmo.vo.EmployeeManagementVO;

@Controller
public class EmployeeManagementController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private EmployeeManagementService employeeManagementService;
	
	@RequestMapping(value = "/employeeManagement.do")
	public String employeeManagementView(@ModelAttribute("employeeManagementVO") EmployeeManagementVO employeeManagementVO, ModelMap model) 
			throws Exception {
		List<EmployeeManagementVO> employeeManagementSelect = employeeManagementService.selectEmployeeManagement(employeeManagementVO);
		System.out.println(employeeManagementSelect.get(0).getEmployeeId());
		model.addAttribute("employeeManagementSelect", employeeManagementSelect);
		return "Employee/employeeManagement";
	}
	
	@RequestMapping(value = "/selectEmployeeInfo.ajax")
	public ModelAndView selectEmployeeInfo(@ModelAttribute("employeeManagementVO") EmployeeManagementVO employeeManagementVO, ModelMap model) 
			throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		//		System.out.println(newCarSelectVO.getBodytype());
		List<EmployeeManagementVO> selectEmployeeInfo = employeeManagementService.selectEmployeeInfo(employeeManagementVO);
		mv.addObject("resultList", selectEmployeeInfo);
		return mv;
	}
	
	//グリッド削除
		@RequestMapping(value = "/deleteEmployeeInfo.ajax")
		public ModelAndView deleteNewEmployeeInfo(@ModelAttribute("employeeManagementVO") EmployeeManagementVO employeeManagementVO, ModelMap model) throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			System.out.println("削除 ajax !!!!!!!!!!!");
//			System.out.println("削除 ajax !!!!!!!!!!!" + newCarSelectVO.getEstimatenumber() + " " + newCarSelectVO.getCustomerid());
			int resultCnt= employeeManagementService.deleteEmployeeInfo(employeeManagementVO);
			mv.addObject("resultCnt", resultCnt);
			return mv;
		}	
	
}