<%@ page pageEncoding="UTF-8" %>
<c:if test="${!empty sessionScope.myList}">
	<p>宠物推荐<br />
	商店里还有其他您可能喜欢的同类型宠物.</p>
	<ul>
		<c:forEach var="product" items="${sessionScope.myList}">
			<li>
			<a href="viewproduct?productId=${product.productId}">${product.name}</a>(${product.productId})
			</li>
		</c:forEach>
	</ul>

</c:if>
