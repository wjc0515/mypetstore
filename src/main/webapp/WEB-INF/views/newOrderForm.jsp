<%@ page pageEncoding="UTF-8"%>
<%@ include file="IncludeTop.jsp"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<div id="Catalog">
<!--  
<form action="newOrderForm" method="post">

	<table>
		<tr>
			<th colspan=2>付款方式</th>
		</tr>
		<tr>
			<td>信用卡类型:</td>
			<td>
			<select name="cardType">
		   	<c:forEach items="${creditCardTypes}" var="entry">
            		<option value="${entry.key}" 
            		   <c:if test="${initOrder.cardType eq entry.value}">
            		     selected="selected"
            		   </c:if> >${entry.value}</option>
        	</c:forEach>
		</select>
			</td>
		</tr>
		<tr>
			<td>信用卡卡号:</td>
			<td><input type="text" name="creditCard" /></td>
		</tr>
		<tr>
			<td>有效时间(MM/YYYY):</td>
			<td><input type="text" name="expiryDate" /></td>
		</tr>
		<tr>
			<th colspan=2>账单寄送地址</th>
		</tr>

		<tr>
			<td>名字:</td>
			<td><input type="text" name="billToFirstName" /></td>
		</tr>
		<tr>
			<td>姓氏:</td>
			<td><input type="text" name="billToLastName" /></td>
		</tr>
		<tr>
			<td>账单寄送地址1:</td>
			<td><input type="text" size="40" name="billAddress1" /></td>
		</tr>
		<tr>
			<td>账单寄送地址2:</td>
			<td><input type="text" size="40" name="billAddress2" /></td>
		</tr>
		<tr>
			<td>城市:</td>
			<td><input type="text" name="billCity" /></td>
		</tr>
		<tr>
			<td>省/州:</td>
			<td><input type="text" size="4" name="billState" /></td>
		</tr>
		<tr>
			<td>邮编:</td>
			<td><input type="text" size="10" name="billZip" /></td>
		</tr>
		<tr>
			<td>国家:</td>
			<td><input type="text" size="15" name="billCountry" /></td>
		</tr>

	</table>

	<input type="submit" name="newOrder" value="下一步" />

</form>
-->
<sf:form action="newOrderForm" method="post" modelAttribute="order">
	<fieldset>
	   	<table>
		<tr>
			<th colspan=2>付款方式</th>
		</tr>
		<tr>
			<td>信用卡类型:</td>
			<td>
			<sf:select path="cardType" items="${creditCardTypes}" />
			</td>
		</tr>
		<tr>
			<td>信用卡卡号:</td>
			<td><sf:input path="creditCard" /></td>
		</tr>
		<tr>
			<td>有效时间(MM/YYYY):</td>
			<td><sf:input path="expiryDate"/></td>
		</tr>
		<tr>
			<th colspan=2>账单寄送地址</th>
		</tr>

		<tr>
			<td>名字:</td>
			<td><sf:input path="billToFirstName"/></td>
		</tr>
		<tr>
			<td>姓氏:</td>
			<td><sf:input path="billToLastName"/></td>
		</tr>
		<tr>
			<td>账单寄送地址1:</td>
			<td><sf:input path="billAddress1" size="40"/></td>
		</tr>
		<tr>
			<td>账单寄送地址2:</td>
			<td><sf:input path="billAddress2" size="40"/></td>
		</tr>
		<tr>
			<td>城市:</td>
			<td><sf:input path="billCity" /></td>
		</tr>
		<tr>
			<td>省/州:</td>
			<td><sf:input path="billState" size="4" /></td>
		</tr>
		<tr>
			<td>邮编:</td>
			<td><sf:input path="billZip" size="10" /></td>
		</tr>
		<tr>
			<td>国家:</td>
			<td><sf:input path="billCountry" size="15" /></td>
		</tr>
	  </table>
	  <sf:hidden path="userid" value="${order.userid }" />
	  <sf:hidden path="orderDate" value="${order.orderDate }" />
	  <input type="submit" value="下一步"/>
	</fieldset>
</sf:form>

</div>

<%@ include file="IncludeBottom.jsp"%>