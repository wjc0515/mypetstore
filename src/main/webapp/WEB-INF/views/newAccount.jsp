<%@ page pageEncoding="UTF-8" %>
<%@ include file="IncludeTop.jsp"%>

<div id="Catalog">
<form id="newAccount" action="newAccountForm" method="POST">
	<h3>账户信息</h3>

	<table>
		<tr>
			<td>请输入用户名:</td>
			<td><input type="text" name="userid" /></td>
		</tr>
		<tr>
			<td>请输入用户密码:</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>请再次输入密码:</td>
			<td><input type="password" name="repeatedPassword" /></td>
		</tr>
	</table>

	<%@ include file="IncludeAccountFields.jsp"%>

	<input type="submit" name="newAccount" value="保存账户信息" />

</form>
</div>

<%@ include file="IncludeBottom.jsp"%>