<%@ page pageEncoding="UTF-8"%>
<%@ include file="IncludeTop.jsp"%>

<div id="Catalog">
	<form id="editAccount" action="editAccountForm" method="POST">

		<h3>账户信息</h3>

		<table>
			<tr>
				<td>用户名:</td>
				<td>${sessionScope.account.userid}<input type="hidden"
					name="userid" value="${sessionScope.account.userid}" /></td>
			</tr>
			<tr>
				<td>请输入新密码:</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>请再次输入新密码:</td>
				<td><input type="password" name="repeatedPassword" /></td>
			</tr>
		</table>
		<%@ include file="IncludeAccountFields.jsp"%>

		<input type="submit" name="editAccount" value="保存账户信息" />

	</form>

	<a href="listOrder">我的订单</a>

</div>
<%@ include file="IncludeBottom.jsp"%>