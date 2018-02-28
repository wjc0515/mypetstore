<%@ page pageEncoding="UTF-8"%>
<%@ include file="IncludeTop.jsp"%>

<div id="Welcome">
<div id="WelcomeContent">
<c:if test="${sessionScope.account != null }">
	<c:if test="${sessionScope.authenticated}">
         ${sessionScope.account.firstName}&nbsp;欢迎您的光临!
    </c:if>
</c:if>
</div>
</div>

<div id="Main">
<div id="Sidebar">
<div id="SidebarContent">
<a href="viewcategory?categoryId=FISH" >
	<img src="images/fish_icon.gif" />
</a>
<br />
海洋鱼类, 淡水鱼类 <br />
<a href="viewcategory?categoryId=DOGS" >
	<img src="images/dogs_icon.gif" />
</a>
<br />
品种齐全 <br />
<a href="viewcategory?categoryId=CATS" >
	<img src="images/cats_icon.gif" />
</a>
<br />
品种齐全, 更有国外奇异品种 <br /> 
<a href="viewcategory?categoryId=REPTILES" >
	<img src="images/reptiles_icon.gif" />
</a>
<br />
蜥蜴, 海龟, 宠物蛇 <br />
<a href="viewcategory?categoryId=BIRDS" >
	<img src="images/birds_icon.gif" />
</a>
<br />
奇异品种</div>
</div>

<div id="MainImage">
<div id="MainImageContent">
  <map name="estoremap">
	<area alt="Birds" coords="72,2,280,250"
		href="viewcategory?categoryId=BIRDS" shape="RECT" />
	<area alt="Fish" coords="2,180,72,250"
		href="viewcategory?categoryId=FISH" shape="RECT" />
	<area alt="Dogs" coords="60,250,130,320"
		href="viewcategory?categoryId=DOGS" shape="RECT" />
	<area alt="Reptiles" coords="140,270,210,340"
		href="viewcategory?categoryId=REPTILES" shape="RECT" />
	<area alt="Cats" coords="225,240,295,310"
		href="viewcategory?categoryId=CATS" shape="RECT" />
	<area alt="Birds" coords="280,180,350,250"
		href="viewcategory?categoryId=BIRDS" shape="RECT" />
  </map> 
  <img height="355" src="images/splash.gif" align="middle"
	usemap="#estoremap" width="350" /></div>
</div>

<div id="Separator">&nbsp;</div>
</div>

<%@ include file="IncludeBottom.jsp"%>