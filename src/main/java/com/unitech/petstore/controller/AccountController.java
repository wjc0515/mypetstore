package com.unitech.petstore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.unitech.petstore.domain.Account;
import com.unitech.petstore.domain.Product;
import com.unitech.petstore.service.AccountService;
import com.unitech.petstore.service.CatalogService;

@Controller
public class AccountController {

	@Autowired
	private CatalogService catalogService;
	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "signon", method = RequestMethod.GET)
	public String signon() {
		return "signon";
	}

	@RequestMapping(value = "signonForm", method = RequestMethod.POST)
	public ModelAndView signonForm(@RequestParam("userid") String username,
			@RequestParam("password") String password,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		Account account = accountService.getAccount(username, password);

		ModelAndView mv = new ModelAndView("signon");
		if (account == null) {
			String value = "用户名或密码错误，请重新输入。";
			mv.addObject("message", value);
		} else {
			mv = new ModelAndView("main");

			account.setPassword(null);
			List<Product> myList = catalogService
					.getProductListByCategory(account.getFavouriteCategoryId());
			boolean authenticated = true;
			session.setAttribute("authenticated", authenticated);
			session.setAttribute("account", account);
			session.setAttribute("myList", myList);
		}

		return mv;
	}

	@RequestMapping(value = "signoff", method = RequestMethod.GET)
	public ModelAndView signoff(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("main");
		return mv;
	}

	@RequestMapping(value = "newAccount", method = RequestMethod.GET)
	public ModelAndView newAccount() {
		ModelAndView mv = new ModelAndView("newAccount");

		mv.addObject("languages", initLanguageList());
		mv.addObject("categories", initCategoryList());

		return mv;
	}

	private Map<String, String> initLanguageList() {
		Map<String, String> langList = new HashMap<String, String>();
		langList.put("英语(美国)", "english");
		langList.put("简体中文", "chinese");
		return langList;
	}

	private Map<String, String> initCategoryList() {
		Map<String, String> catList = new HashMap<String, String>();
		catList.put("鱼", "FISH");
		catList.put("狗", "DOGS");
		catList.put("爬虫", "REPTILES");
		catList.put("猫", "CATS");
		catList.put("鸟", "BIRDS");
		return catList;
	}

	@RequestMapping(value = "newAccountForm", method = RequestMethod.POST)
	public ModelAndView newAccountForm(
			@ModelAttribute("newAccount") Account account) {

		ModelAndView mv = new ModelAndView("signon");

		accountService.insertAccount(account);

		// boolean authenticated = true;

		return mv;
	}

	@RequestMapping(value = "editaccount", method = RequestMethod.GET)
	public ModelAndView editAccount() {
		ModelAndView mv = new ModelAndView("editAccount");

		mv.addObject("languages", initLanguageList());
		mv.addObject("categories", initCategoryList());

		return mv;
	}

	@RequestMapping(value = "editAccountForm", method = RequestMethod.POST)
	public ModelAndView editAccountForm(
			@ModelAttribute("editAccount") Account account, HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("signon");
		accountService.updateAccount(account);

		return mv;
	}

}
