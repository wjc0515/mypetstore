package com.unitech.petstore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.unitech.petstore.domain.Account;
import com.unitech.petstore.domain.Cart;
import com.unitech.petstore.domain.Order;
import com.unitech.petstore.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "newOrder", method = RequestMethod.GET)
	public ModelAndView newOrder(HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		Cart cart = (Cart) session.getAttribute("cart");
		boolean isAuthenticated = (Boolean) session
				.getAttribute("authenticated");

		ModelAndView mv = new ModelAndView("signon");
		if (account == null || !isAuthenticated) {
			String value = "请先登录后再继续结账。";
			mv.addObject("message", value);
		} else if (cart != null) {
			Order order = new Order();
			order.initOrder(account, cart);
			session.setAttribute("order", order);
			mv = new ModelAndView("newOrderForm");
			mv.addObject("order", order);
			mv.addObject("creditCardTypes", initCreditCards());

		}

		return mv;
	}

	private Map<String, String> initCreditCards() {
		Map<String, String> cardList = new HashMap<String, String>();
		cardList.put("Visa", "Visa");
		cardList.put("MasterCard", "万事达");
		cardList.put("UnionPay", "银联");
		return cardList;
	}

	@RequestMapping(value = "newOrderForm", method = RequestMethod.POST)
	// public ModelAndView newOrderForm(HttpServletRequest request,
	// HttpSession session) {
	// Order order = (Order) session.getAttribute("order");
	//
	// order.setCardType(request.getParameter("cardType"));
	// order.setCreditCard(request.getParameter("creditCard"));
	// order.setExpiryDate(request.getParameter("expiryDate"));
	// order.setBillToFirstName(request.getParameter("billToFirstName"));
	// order.setBillToLastName(request.getParameter("billToLastName"));
	// order.setBillAddress1(request.getParameter("billAddress1"));
	// order.setBillAddress2(request.getParameter("billAddress2"));
	// order.setBillCity(request.getParameter("billCity"));
	// order.setBillState(request.getParameter("billState"));
	// order.setBillZip(request.getParameter("billZip"));
	// order.setBillCountry(request.getParameter("billCountry"));
	//
	// ModelAndView mv = new ModelAndView("shippingForm");
	// return mv;
	// }
	public ModelAndView newOrderForm(@Validated Order order, BindingResult bindingResult, HttpSession session) {
		Order sessionOrder = (Order) session.getAttribute("order");

		ModelAndView mv = new ModelAndView("shippingForm");
		mv.addObject("order", sessionOrder);
		
		// 把第一步的输入保存起来
		sessionOrder.setCardType(order.getCardType());
		sessionOrder.setCreditCard(order.getCreditCard());
		sessionOrder.setExpiryDate(order.getExpiryDate());
		sessionOrder.setBillToFirstName(order.getBillToFirstName());
		sessionOrder.setBillToLastName(order.getBillToLastName());
		sessionOrder.setBillAddress1(order.getBillAddress1());
		sessionOrder.setBillAddress2(order.getBillAddress2());
		sessionOrder.setBillCity(order.getBillCity());
		sessionOrder.setBillState(order.getBillState());
		sessionOrder.setBillZip(order.getBillZip());
		sessionOrder.setBillCountry(order.getBillCountry());
		session.setAttribute("order", sessionOrder);

		return mv;
	}

	@RequestMapping(value = "shippingForm", method = RequestMethod.POST)
	// public ModelAndView shippingForm(HttpServletRequest request,
	// HttpSession session) {
	// Order order = (Order) session.getAttribute("order");
	//
	// order.setShipToFirstName(request.getParameter("shipToFirstName"));
	// order.setShipToLastName(request.getParameter("shipToLastName"));
	// order.setShipAddress1(request.getParameter("shipAddress1"));
	// order.setShipAddress2(request.getParameter("shipAddress2"));
	// order.setShipCity(request.getParameter("shipCity"));
	// order.setShipState(request.getParameter("shipState"));
	// order.setShipZip(request.getParameter("shipZip"));
	// order.setShipCountry(request.getParameter("shipCountry"));
	//
	// ModelAndView mv = new ModelAndView("confirmOrder");
	// return mv;
	// }
	public ModelAndView shippingForm(@Validated Order order, BindingResult bindingResult, HttpSession session) {
		Order sessionOrder = (Order) session.getAttribute("order");

		//保存第二步的输入
		sessionOrder.setShipToFirstName(order.getShipToFirstName());
		sessionOrder.setShipToLastName(order.getShipToLastName());
		sessionOrder.setShipAddress1(order.getShipAddress1());
		sessionOrder.setShipAddress2(order.getShipAddress2());
		sessionOrder.setShipCity(order.getShipCity());
		sessionOrder.setShipState(order.getShipState());
		sessionOrder.setShipZip(order.getShipZip());
		sessionOrder.setShipCountry(order.getShipCountry());
		session.setAttribute("order", sessionOrder);

		ModelAndView mv = new ModelAndView("confirmOrder");
		return mv;
	}

	@RequestMapping(value = "completeOrder", method = RequestMethod.GET)
	public ModelAndView completeOrder(HttpSession session) {
		Order order = (Order) session.getAttribute("order");
		orderService.insertOrder(order);

		// 清空会话中保存的订单
		session.removeAttribute("order");
		// 清空购物车
		session.removeAttribute("cart");

		ModelAndView mv = new ModelAndView("listOrders");
		Account account = (Account) session.getAttribute("account");
		List<Order> savedOrders = orderService.getOrdersByUserid(account
				.getUserid());
		mv.addObject("orderList", savedOrders);

		String message = "谢谢您，您的订单已经提交.";
		mv.addObject("message", message);

		return mv;
	}

	@RequestMapping(value = "listOrder", method = RequestMethod.GET)
	public ModelAndView listOrder(HttpSession session) {
		ModelAndView mv = new ModelAndView("listOrders");
		Account account = (Account) session.getAttribute("account");
		List<Order> savedOrders = orderService.getOrdersByUserid(account
				.getUserid());
		mv.addObject("orderList", savedOrders);

		return mv;
	}

	@RequestMapping(value = "viewOrder", method = RequestMethod.GET)
	public ModelAndView listOrder(@RequestParam("orderId") int orderId,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("viewOrder");

		Order order = orderService.getOrder(orderId);
		mv.addObject("order", order);

		return mv;
	}

}
