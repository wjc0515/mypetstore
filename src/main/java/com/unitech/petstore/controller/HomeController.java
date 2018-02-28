package com.unitech.petstore.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/index")
public class HomeController {

	@RequestMapping(method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
}
