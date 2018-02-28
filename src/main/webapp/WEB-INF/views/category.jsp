<%@ page pageEncoding="UTF-8" %>
<%@ include file="IncludeTop.jsp"%>

<div id="BackLink">
<a href="index">返回首页</a>
</div>

<div id="Catalog">

${category.description}

<table>
	<tr>
	    <th></th>
		<th>宠物编号</th>
		<th>宠物名称</th>
	</tr>
	<c:forEach var="product" items="${productList}">
		<tr>
		    <td>
		      <img src="images/${product.image }" />
		    </td>
			<td>
			<a href="viewproduct?productId=${product.productId}">${product.productId}</a>
			</td>
			<td>${product.name}</td>
		</tr>
	</c:forEach>
</table>

</div>

<%@ include file="IncludeBottom.jsp"%>