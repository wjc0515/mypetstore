<%@ page pageEncoding="UTF-8"%>
<%@ include file="IncludeTop.jsp"%>

<div id="BackLink">
<a href="index">返回首页</a>
</div>

<div id="Catalog">
请确认订单信息，再继续操作.

<table>
	<tr>
		<th align="center" colspan="2">
			<font size="4">
				<b>订单信息</b>
			</font>
			<br />
			<font size="3">
				<b> <fmt:formatDate value="${sessionScope.order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss" /></b>
			</font>
		</th>
	</tr>

	<tr>
		<th colspan="2">账单地址</th>
	</tr>
	<tr>
		<td>名字:</td>
		<td><c:out value="${sessionScope.order.billToFirstName}" /></td>
	</tr>
	<tr>
		<td>姓氏:</td>
		<td><c:out value="${sessionScope.order.billToLastName}" /></td>
	</tr>
	<tr>
		<td>账单寄送地址1:</td>
		<td><c:out value="${sessionScope.order.billAddress1}" /></td>
	</tr>
	<tr>
		<td>账单寄送地址2:</td>
		<td><c:out value="${sessionScope.order.billAddress2}" /></td>
	</tr>
	<tr>
		<td>城市:</td>
		<td><c:out value="${sessionScope.order.billCity}" /></td>
	</tr>
	<tr>
		<td>省/州:</td>
		<td><c:out value="${sessionScope.order.billState}" /></td>
	</tr>
	<tr>
		<td>邮编:</td>
		<td><c:out value="${sessionScope.order.billZip}" /></td>
	</tr>
	<tr>
		<td>国家:</td>
		<td><c:out value="${sessionScope.order.billCountry}" /></td>
	</tr>
	<tr>
		<th colspan="2">送货地址</th>
	</tr>
	<tr>
		<td>名字:</td>
		<td><c:out value="${sessionScope.order.shipToFirstName}" /></td>
	</tr>
	<tr>
		<td>姓氏:</td>
		<td><c:out value="${sessionScope.order.shipToLastName}" /></td>
	</tr>
	<tr>
		<td>宠物配送地址1:</td>
		<td><c:out value="${sessionScope.order.shipAddress1}" /></td>
	</tr>
	<tr>
		<td>宠物配送地址2:</td>
		<td><c:out value="${sessionScope.order.shipAddress2}" /></td>
	</tr>
	<tr>
		<td>城市:</td>
		<td><c:out value="${sessionScope.order.shipCity}" /></td>
	</tr>
	<tr>
		<td>省/州:</td>
		<td><c:out value="${sessionScope.order.shipState}" /></td>
	</tr>
	<tr>
		<td>邮编:</td>
		<td><c:out value="${sessionScope.order.shipZip}" /></td>
	</tr>
	<tr>
		<td>国家:</td>
		<td><c:out value="${sessionScope.order.shipCountry}" /></td>
	</tr>

</table>

<a href="completeOrder">确定提交</a>
</div>

<%@ include file="IncludeBottom.jsp"%>





