<%@ page pageEncoding="UTF-8" %>
<%@ include file="IncludeTop.jsp"%>

<div id="BackLink">
<a href="index">返回首页</a>
</div>

<div id="Catalog">

<div id="Cart">

<h2>我的购物车</h2>
<form action="updateCartQuantities" method="post">
	<table>
		<tr>
			<th><b>货架编号</b></th>
			<th><b>宠物编号</b></th>
			<th><b>宠物简介</b></th>
			<th><b>库存情况</b></th>
			<th><b>购买数量</b></th>
			<th><b>最后报价</b></th>
			<th><b>单项总花费</b></th>
			<th>&nbsp;</th>
		</tr>

		<c:if test="${cart.numberOfItems == 0}">
			<tr>
				<td colspan="8"><b>你还没有添加任何宠物。</b></td>
			</tr>
		</c:if>

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
				<td>
				<input type="text" name="${cartItem.item.itemId}" value="${cartItem.quantity}" />
				</td>
				<td>
				<fmt:formatNumber value="${cartItem.item.listPrice}"
					pattern="$#,##0.00" />
				</td>
				<td>
				<fmt:formatNumber value="${cartItem.total}"
					pattern="$#,##0.00" />
				</td>
				<td>
            	<a href="removeItemFromCart?cartItem=${cartItem.item.itemId}">删除</a>
            	</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7">总金额: 
			<fmt:formatNumber value="${cart.subTotal}" pattern="$#,##0.00" />
			<input type="submit" name="updateCartQuantities" value="更新购物车" />
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</form>

 <c:if test="${cart.numberOfItems > 0}">
     <a href="newOrderForm">去结账</a>
</c:if>

</div>

<div id="MyList">
  <c:if test="${sessionScope.account != null}">
	<c:if test="${sessionScope.authenticated}">
	  <c:if test="${sessionScope.account.isListOption}">
	    <%@ include file="IncludeMyList.jsp"%>
      </c:if>
	</c:if>
  </c:if>
</div>

<div id="Separator">&nbsp;</div>
</div>

<%@ include file="IncludeBottom.jsp"%>