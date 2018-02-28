<%@ page pageEncoding="UTF-8"%>
<%@ include file="IncludeTop.jsp"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div id="Catalog">
<!--<form action="shippingForm" method="post">

	<table>
		<tr>
			<th colspan=2>送货地址</th>
		</tr>

		<tr>
			<td>名字:</td>
			<td><input type="text" name="shipToFirstName" value="${sessionScope.order.billToFirstName }"/></td>
		</tr>
		<tr>
			<td>姓氏:</td>
			<td><input type="text" name="shipToLastName" value="${sessionScope.order.billToLastName }"/></td>
		</tr>
		<tr>
			<td>宠物配送地址1:</td>
			<td><input type="text" size="40" name="shipAddress1" value="${sessionScope.order.billAddress1 }"/></td>
		</tr>
		<tr>
			<td>宠物配送地址2:</td>
			<td><input type="text" size="40" name="shipAddress2" value="${sessionScope.order.billAddress2 }"/></td>
		</tr>
		<tr>
			<td>城市:</td>
			<td><input type="text" name="shipCity" value="${sessionScope.order.billCity }"/></td>
		</tr>
		<tr>
			<td>省/周:</td>
			<td><input type="text" size="4" name="shipState" value="${sessionScope.order.billState }"/></td>
		</tr>
		<tr>
			<td>邮编:</td>
			<td><input type="text" size="10" name="shipZip" value="${sessionScope.order.billZip }"/></td>
		</tr>
		<tr>
			<td>国家:</td>
			<td><input type="text" size="15" name="shipCountry" value="${sessionScope.order.billCountry }"/></td>
		</tr>


	</table>

	<input type="submit" name="newOrder" value="下一步" />
</form>
 -->
 <sf:form action="shippingForm" modelAttribute="order" method="post">
    <table>
		<tr>
			<th colspan=2>送货地址</th>
		</tr>

		<tr>
			<td>名字:</td>
			<td><sf:input path="shipToFirstName"/></td>
		</tr>
		<tr>
			<td>姓氏:</td>
			<td><sf:input path="shipToLastName"/></td>
		</tr>
		<tr>
			<td>宠物配送地址1:</td>
			<td><sf:input path="shipAddress1" size="40" /></td>
		</tr>
		<tr>
			<td>宠物配送地址2:</td>
			<td><sf:input path="shipAddress2" size="40"/></td>
		</tr>
		<tr>
			<td>城市:</td>
			<td><sf:input path="shipCity"/></td>
		</tr>
		<tr>
			<td>省/周:</td>
			<td><sf:input path="shipState" size="4"/></td>
		</tr>
		<tr>
			<td>邮编:</td>
			<td><sf:input path="shipZip" size="10"/></td>
		</tr>
		<tr>
			<td>国家:</td>
			<td><sf:input path="shipCountry" size="15"/></td>
		</tr>
	
	</table>
	<input type="submit" value="下一步" />
 </sf:form>
 
</div>

<%@ include file="IncludeBottom.jsp"%>