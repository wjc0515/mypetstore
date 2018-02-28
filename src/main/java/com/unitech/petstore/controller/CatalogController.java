package com.unitech.petstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.unitech.petstore.domain.Category;
import com.unitech.petstore.domain.Item;
import com.unitech.petstore.domain.Product;
import com.unitech.petstore.service.CatalogService;

@Controller
public class CatalogController {

	@Autowired
	private CatalogService catalogService;

	@RequestMapping(value = "viewcategory", method = RequestMethod.GET)
	public ModelAndView viewCategory(HttpServletRequest request,
			HttpServletResponse response) {
		String categoryId = request.getParameter("categoryId");
		List<Product> productList = catalogService
				.getProductListByCategory(categoryId);
		Category category = catalogService.getCategory(categoryId);

		ModelAndView mv = new ModelAndView("category");
		mv.addObject("productList", productList);
		mv.addObject("category", category);
		return mv;
	}

	@RequestMapping(value = "viewproduct", method = RequestMethod.GET)
	public ModelAndView viewProduct(HttpServletRequest request,
			HttpServletResponse response) {
		String productId = request.getParameter("productId");
		List<Item> itemList = catalogService.getItemListByProduct(productId);
		Product product = catalogService.getProduct(productId);

		ModelAndView mv = new ModelAndView("product");
		mv.addObject("product", product);
		mv.addObject("itemList", itemList);
		return mv;
	}
	
	@RequestMapping(value = "viewitem", method = RequestMethod.GET)
	public ModelAndView viewItem(HttpServletRequest request,
			HttpServletResponse response) {
		String itemId = request.getParameter("itemId");
		Item item = catalogService.getItem(itemId);
	    Product product = item.getProduct();

		ModelAndView mv = new ModelAndView("item");
		mv.addObject("product", product);
		mv.addObject("item", item);
		return mv;
	}

	@RequestMapping(value = "searchproducts", method = RequestMethod.GET)
	public ModelAndView searchProducts(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("searchproducts");
		
		String keyword = request.getParameter("keyword");
		List<Product> productList = catalogService.searchProductList(keyword.toLowerCase());
		if(productList.isEmpty()) {
			mv.addObject("message", "对不起，没有符合条件的宠物。");
		} else {
	        mv.addObject("productList", productList);
	    }
	    return mv;
	}
}
