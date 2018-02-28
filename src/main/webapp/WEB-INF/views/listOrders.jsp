<%@ page pageEncoding="UTF-8" %>
<%@ include file="IncludeTop.jsp"%>

<h2>我的订单</h2>
<c:if test="${message!=null}" >
<font color="red"><b>${message}</b></font> 
</c:if>

<table>
	<tr>
		<th>订单编号</th>
		<th>下单时间</th>
		<th>订单总价</th>
	</tr>

	<c:forEach var="order" items="${orderList}">
		<tr>
			<td>
			  <a href="viewOrder?orderId=${order.orderId}">${order.orderId}</a>
			</td>
			<td><fmt:formatDate value="${order.orderDate}"
				pattern="yyyy/MM/dd hh:mm:ss" /></td>
			<td><fmt:formatNumber value="${order.totalPrice}"
				pattern="$#,##0.00" /></td>
		</tr>
	</c:forEach>
</table>

<%@ include file="IncludeBottom.jsp"%>