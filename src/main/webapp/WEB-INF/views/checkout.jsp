<%@ page pageEncoding="UTF-8"%>
<%@ include file="IncludeTop.jsp"%>

<div id="BackLink">
   <a href="viewcart">返回购物车</a>
</div>

<div id="Catalog">

<table>
	<tr>
		<td>
		<h2>订单明细</h2>

		<table>

			<tr>
				<td><b>货架编号</b></td>
				<td><b>宠物编号</b></td>
				<td><b>宠物简介</b></td>
				<td><b>库存情况</b></td>
				<td><b>购买数量</b></td>
				<td><b>最后报价</b></td>
				<td><b>单项总花费</b></td>
			</tr>

			<c:forEach var="cartItem" items="${cart.cartItems}">
				<tr>
					<td>
					  	<a href="viewitem?itemId=${cartItem.item.itemId}">
			  			${cartItem.item.itemId}
			  			</a>
					</td>
					<td>${cartItem.item.product.productId}</td>
					<td>${cartItem.item.attribute1} ${cartItem.item.attribute2}
					${cartItem.item.attribute3} ${cartItem.item.attribute4}
					${cartItem.item.attribute5} ${cartItem.item.product.name}</td>
					<td>${cartItem.inStock}</td>
					<td>${cartItem.quantity}</td>
					<td><fmt:formatNumber value="${cartItem.item.listPrice}"
						pattern="$#,##0.00" /></td>
					<td><fmt:formatNumber value="${cartItem.total}"
						pattern="$#,##0.00" /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7">Sub Total: <fmt:formatNumber
					value="${cart.subTotal}" pattern="$#,##0.00" /></td>
			</tr>
		</table>

	</tr>
</table>

<a href="newOrder">下一步</a>

</div>

<%@ include file="IncludeBottom.jsp"%>