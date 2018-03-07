package com.cosmo.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cosmo.customer.service.CustomerSelectService;
import com.cosmo.vo.CustomerSelectVO;

@Controller
public class CustomerSelectController {

	@Autowired
	private CustomerSelectService customerSelectSerivce;

	// 初期画面処理
	@RequestMapping("customerView.do")
	public String customerSelectView(ModelMap model) throws Exception {
		return "Customer/customerSelect";
	}

	// 顧客情報検索処理
	@RequestMapping("customerSelect.ajax")
	public ModelAndView customerSelect(@ModelAttribute("customerSelectVO") CustomerSelectVO customerSelectVO,
			Model model) throws Exception {

		ModelAndView mav = new ModelAndView("jsonView");
		List<CustomerSelectVO> customerSelectList = customerSelectSerivce.selectCustomer(customerSelectVO);
		mav.addObject("customerSelect", customerSelectList);
		return mav;
	}

	// 顧客情報詳細処理
	@RequestMapping("customerDetail.ajax")
	public ModelAndView customerDetail(@ModelAttribute("customerSelectVO") CustomerSelectVO customerSelectVO,
			Model model) throws Exception {

		ModelAndView mav = new ModelAndView("jsonView");
		List<CustomerSelectVO> customerDetailList = customerSelectSerivce.detailCustomer(customerSelectVO);
		mav.addObject("customerDetail", customerDetailList);
		return mav;
	}

//	@RequestMapping("test.do")
//	public ModelAndView save(@RequestParam("customerNameKana") String customerNameKana,
//			@RequestParam("customerTelephone") String customerTelephone) {
//
//		ModelAndView mav = new ModelAndView();
//
//		System.out.println("username :" + customerNameKana);
//		System.out.println("searchPhone :" + customerTelephone);
//
//		return mav;
//	}

}
