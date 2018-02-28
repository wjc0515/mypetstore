<%@ page pageEncoding="UTF-8" %>
<%@ include file="IncludeTop.jsp"%>

<div id="BackLink">
<a href="index">返回首页</a>
</div>

<div id="Catalog">
<c:if test="${message != null}">
	<font color="red">${message}</font>
</c:if>
<c:if test="${message == null}">
<table>
	<tr>
		<th>&nbsp;</th>
		<th>宠物编号</th>
		<th>宠物名称</th>
	</tr>
	<c:forEach var="product" items="${productList}">
		<tr>
			<td>
			<a href="viewproduct?productId=${product.productId}">
			${product.description}
			</a>
			</td>
			<td>
			<b>
			<a href="viewproduct?productId=${product.productId}">
			<font color="BLACK"> ${product.productId} </font>
			</a>
			</b>
			</td>
			<td>${product.name}</td>
		</tr>
	</c:forEach>
</table>
</c:if>

</div>

<%@ include file="IncludeBottom.jsp"%>