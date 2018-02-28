<%@ page pageEncoding="UTF-8"%>
<%@ include file="IncludeTop.jsp"%>

<div id="BackLink">
<a href="viewcategory?categoryId=${product.categoryId}">
	返回${product.categoryId}
</a>
</div>

<div id="Catalog">

<h2>${product.name}</h2>

<table>
	<tr>
		<th>货架编号</th>
		<th>宠物编号</th>
		<th>宠物简介</th>
		<th>最后报价</th>
		<th>&nbsp;</th>
	</tr>
	<c:forEach var="item" items="${itemList}">
		<tr>
			<td>
			<a href="viewitem?itemId=${item.itemId}">${item.itemId}</a>
			</td>
			<td>${item.product.productId}</td>
			<td>${item.attribute1} ${item.attribute2} ${item.attribute3}
			${item.attribute4} ${item.attribute5} ${product.name}</td>
			<td>
			<fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00" />
			</td>
			<td>
        	<a href="addItemToCart?workingItemId=${item.itemId}">添加到购物车</a>
        	</td>
		</tr>
	</c:forEach>

</table>

</div>

<%@ include file="IncludeBottom.jsp"%>