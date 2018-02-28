<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="StyleSheet" href="css/jpetstore.css" type="text/css"
	media="screen" />

<meta name="generator"
	content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
<title>宠物商店</title>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
</head>
<body>
	<div id="Header">
		<div id="Logo">
			<div id="LogoContent">
				<a href="index"><img src="images/logo-topbar.gif" /></a>
			</div>
		</div>

		<div id="Menu">
			<div id="MenuContent">
				<a href="viewcart">
				<img align="middle" name="img_cart" src="images/cart.gif" />
				</a> 
				<img align="middle" src="images/separator.gif" />
				<c:if test="${sessionScope.account == null}">
					<a href="signon">登录</a>
				</c:if>
				<c:if test="${sessionScope.account != null}">
					<c:if test="${!sessionScope.authenticated}">
						<a href="signon">登录</a>
					</c:if>
				</c:if>
				<c:if test="${sessionScope.account != null}">
					<c:if test="${sessionScope.authenticated}">
						<a href="signoff">退出</a>
						<img align="middle" src="images/separator.gif" />
						<a href="editaccount">我的账户</a>
					</c:if>
				</c:if>
			</div>
		</div>

		<div id="Search">
			<div id="SearchContent">
				<form action="searchproducts">
					<input type="text" name="keyword" size="14" /> <input
						type="submit" value="搜索" />
				</form>
			</div>
		</div>

		<div id="QuickLinks">
			<a href="viewcategory?categoryId=FISH"> <img
				src="images/sm_fish.gif" />
			</a> <img src="images/separator.gif" /> <a
				href="viewcategory?categoryId=DOGS"><img
				src="images/sm_dogs.gif" /></a> <img src="images/separator.gif" /> <a
				href="viewcategory?categoryId=REPTILES"><img
				src="images/sm_reptiles.gif" /></a> <img src="images/separator.gif" />
			<a href="viewcategory?categoryId=CATS"><img
				src="images/sm_cats.gif" /></a> <img src="images/separator.gif" /> <a
				href="viewcategory?categoryId=BIRDS"><img
				src="images/sm_birds.gif" /></a>
		</div>

	</div>

	<div id="Content">