<%@ page pageEncoding="UTF-8" %>
<%@ include file="IncludeTop.jsp"%>

<div id="BackLink">
<a href="viewproduct?productId=${product.productId}">
	返回${product.productId}
</a>
</div>

<div id="Catalog">

<table>
    <tr>
       <td><img src="images/${product.image}" /></td>
    </tr>
	<tr>
		<td>${product.description}</td>
	</tr>
	<tr>
		<td><b> ${item.itemId} </b></td>
	</tr>
	<tr>
		<td><b><font size="4"> ${item.attribute1}
		${item.attribute2} ${item.attribute3}
		${item.attribute4} ${item.attribute5}
		${product.name} </font></b></td>
	</tr>
	<tr>
		<td>${product.name}</td>
	</tr>
	<tr>
		<td><c:if test="${item.quantity <= 0}">
        	需要备货.
      </c:if> <c:if test="${item.quantity > 0}">
      	          库存充足：${item.quantity}.
	  </c:if></td>
	</tr>
	<tr>
		<td>
		<fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00" />
		</td>
	</tr>

	<tr>
		<td>
        	<a href="addItemToCart?workingItemId=${item.itemId}">添加到购物车</a>
        </td>
	</tr>
</table>

</div>

<%@ include file="IncludeBottom.jsp"%>