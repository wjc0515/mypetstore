<%@ page pageEncoding="UTF-8" %>
<%@ include file="IncludeTop.jsp"%>

<div id="Catalog">
<c:if test="${message!=null}" >
<font color="red"><b>${message}</b></font> 
</c:if>
<form action="signonForm" method="post">
	<p>请输入您的用户名和密码。</p>
	<p>用户名:<input type="text" name="userid"/> <br />
	密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="password"/></p>
	<input type="submit" name="signon" value="登录" />
</form>
<p>需要创建一个新账户?</p>
<a href="newAccount">现在就注册!</a>
</div>

<%@ include file="IncludeBottom.jsp"%>