package com.cosmo.employee.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmo.customer.HomeController;
import com.cosmo.employee.service.EmployeeSelectService;
import com.cosmo.vo.EmployeeSelectVO;

@Controller
public class EmployeeSelectController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EmployeeSelectService employeeSelectService;

	@RequestMapping(value = "/main.do")
	public String employeeSelectView(@ModelAttribute("employeeSelectVO") EmployeeSelectVO employeeSelectVO,
			ModelMap model) throws Exception {
		List<EmployeeSelectVO> employeeSelect = employeeSelectService.selectEmployee(employeeSelectVO);
		model.addAttribute("employeeSelect", employeeSelect);
		return "LogIn/main";
	}

	@RequestMapping("changepwdView.do")
	public String changePwdView() throws Exception {
		return "LogIn/changePassword";
	}

	@RequestMapping("changepwd.ajax")
	public void changePwd(@ModelAttribute("employeeSelectVO") EmployeeSelectVO employeeSelectVO) throws Exception {
		employeeSelectService.changePassword(employeeSelectVO);
	}

}
