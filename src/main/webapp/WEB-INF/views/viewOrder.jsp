<%@ page pageEncoding="UTF-8" %>
<%@ include file="IncludeTop.jsp"%>

<div id="BackLink">
<a href="index">返回首页</a>
</div>

<div id="Catalog">

<table>
	<tr>
		<th align="center" colspan="2">订单 #${order.orderId}
		<fmt:formatDate value="${order.orderDate}"
			pattern="yyyy/MM/dd hh:mm:ss" /></th>
	</tr>
	<tr>
		<th colspan="2">付款方式</th>
	</tr>
	<tr>
		<td>信用卡类型:</td>
		<td><c:out value="${order.cardType}" /></td>
	</tr>
	<tr>
		<td>信用卡卡号:</td>
		<td><c:out value="${order.creditCard}" /></td>
	</tr>
	<tr>
		<td>信用卡有效期(MM/YYYY):</td>
		<td><c:out value="${order.expiryDate}" /></td>
	</tr>
	<tr>
		<th colspan="2">账单寄送</th>
	</tr>
	<tr>
		<td>名字:</td>
		<td><c:out value="${order.billToFirstName}" /></td>
	</tr>
	<tr>
		<td>姓氏:</td>
		<td><c:out value="${order.billToLastName}" /></td>
	</tr>
	<tr>
		<td>寄送地址1:</td>
		<td><c:out value="${order.billAddress1}" /></td>
	</tr>
	<tr>
		<td>寄送地址2:</td>
		<td><c:out value="${order.billAddress2}" /></td>
	</tr>
	<tr>
		<td>城市:</td>
		<td><c:out value="${order.billCity}" /></td>
	</tr>
	<tr>
		<td>省/州:</td>
		<td><c:out value="${order.billState}" /></td>
	</tr>
	<tr>
		<td>邮编:</td>
		<td><c:out value="${order.billZip}" /></td>
	</tr>
	<tr>
		<td>国家:</td>
		<td><c:out value="${order.billCountry}" /></td>
	</tr>
	<tr>
		<th colspan="2">宠物配送</th>
	</tr>
	<tr>
		<td>名字:</td>
		<td><c:out value="${order.shipToFirstName}" /></td>
	</tr>
	<tr>
		<td>姓氏:</td>
		<td><c:out value="${order.shipToLastName}" /></td>
	</tr>
	<tr>
		<td>配送地址1:</td>
		<td><c:out value="${order.shipAddress1}" /></td>
	</tr>
	<tr>
		<td>配送地址2:</td>
		<td><c:out value="${order.shipAddress2}" /></td>
	</tr>
	<tr>
		<td>城市:</td>
		<td><c:out value="${order.shipCity}" /></td>
	</tr>
	<tr>
		<td>省/州:</td>
		<td><c:out value="${order.shipState}" /></td>
	</tr>
	<tr>
		<td>邮编:</td>
		<td><c:out value="${order.shipZip}" /></td>
	</tr>
	<tr>
		<td>国家:</td>
		<td><c:out value="${order.shipCountry}" /></td>
	</tr>
	<tr>
		<td>物流公司:</td>
		<td><c:out value="${order.courier}" /></td>
	</tr>
	<tr>
		<td colspan="2">订单状态: <c:out value="${order.status}" /></td>
	</tr>
	<tr>
		<td colspan="2">
		<table>
			<tr>
				<th>货架编号</th>
				<th>宠物简介</th>
				<th>数量</th>
				<th>单价</th>
				<th>单项总价</th>
			</tr>
			<c:forEach var="lineItem" items="${order.lineItems}">
				<tr>
					<td>
						<a href="viewitem?itemId=${lineItem.itemId}">
			  				${lineItem.itemId}
			  			</a>
					</td>
					<td><c:if test="${lineItem.item != null}">
						${lineItem.item.attribute1}
						${lineItem.item.attribute2}
						${lineItem.item.attribute3}
						${lineItem.item.attribute4}
						${lineItem.item.attribute5}
						${lineItem.item.product.name}
					</c:if> <c:if test="${lineItem.item == null}">
						<i>{description unavailable}</i>
					</c:if></td>

					<td>${lineItem.quantity}</td>
					<td><fmt:formatNumber value="${lineItem.unitPrice}"
						pattern="$#,##0.00" /></td>
					<td><fmt:formatNumber value="${lineItem.total}"
						pattern="$#,##0.00" /></td>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="5">Total: <fmt:formatNumber
					value="${order.totalPrice}" pattern="$#,##0.00" /></th>
			</tr>
		</table>
		</td>
	</tr>

</table>

</div>

<%@ include file="IncludeBottom.jsp"%>