package com.unitech.petstore.controller;

import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.unitech.petstore.domain.Cart;
import com.unitech.petstore.domain.CartItem;
import com.unitech.petstore.domain.Item;
import com.unitech.petstore.service.CatalogService;

@Controller
public class CartController {

	@Autowired
	private CatalogService catalogService;

	@RequestMapping(value = "viewcart", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "cart";
	}

	@RequestMapping(value = "addItemToCart", method = RequestMethod.GET)
	public ModelAndView addItemToCart(
			@RequestParam("workingItemId") String workingItemId,
			HttpSession session) {
		Cart cart = new Cart();
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		}

		if (cart.containsItemId(workingItemId)) {
			cart.incrementQuantityByItemId(workingItemId);
		} else {
			// isInStock is a "real-time" property that must be updated
			// every time an item is added to the cart, even if other
			// item details are cached.
			boolean isInStock = catalogService.isItemInStock(workingItemId);
			Item item = catalogService.getItem(workingItemId);
			cart.addItem(item, isInStock);
		}

		ModelAndView mv = new ModelAndView("cart");
		mv.addObject("cart", cart);
		session.setAttribute("cart", cart);

		return mv;
	}

	@RequestMapping(value = "removeItemFromCart", method = RequestMethod.GET)
	public ModelAndView removeItemFromCart(
			@RequestParam("cartItem") String cartItem,
			HttpSession session) {
		Cart cart = new Cart();
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		}

		cart.removeItemById(cartItem);

		ModelAndView mv = new ModelAndView("cart");
		mv.addObject("cart", cart);
		session.setAttribute("cart", cart);

		return mv;
	}

	@RequestMapping(value = "updateCartQuantities", method = RequestMethod.POST)
	public ModelAndView updateCartQuantities(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		Cart cart = new Cart();
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		}

		Iterator<CartItem> cartItems = cart.getAllCartItems();
		while (cartItems.hasNext()) {
			CartItem cartItem = cartItems.next();
			String itemId = cartItem.getItem().getItemId();
			try {
				int quantity = Integer.parseInt(request.getParameter(itemId));
				cart.setQuantityByItemId(itemId, quantity);
				if (quantity < 1) {
					cartItems.remove();
				}
			} catch (Exception e) {
				// ignore parse exceptions on purpose
			}
		}

		ModelAndView mv = new ModelAndView("cart");
		mv.addObject("cart", cart);
		session.setAttribute("cart", cart);

		return mv;
	}
	
	@RequestMapping(value = "newOrderForm", method = RequestMethod.GET)
	public String newOrderForm(Locale locale, Model model) {
		return "checkout";
	}

}
