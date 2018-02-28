<%@ page pageEncoding="UTF-8" %>
<h3>用户信息</h3>

<table>
	<tr>
		<td>名字:</td>
		<td><input type="text" name="firstName" value="${sessionScope.account.firstName }" /></td>
	</tr>
	<tr>
		<td>姓氏:</td>
		<td><input type="text" name="lastName" value="${sessionScope.account.lastName }"/></td>
	</tr>
	<tr>
		<td>电子邮件:</td>
		<td><input type="text" size="40" name="email" value="${sessionScope.account.email }"/></td>
	</tr>
	<tr>
		<td>联系电话:</td>
		<td><input type="text" name="phone" value="${sessionScope.account.phone }"/></td>
	</tr>
	<tr>
		<td>联系地址1:</td>
		<td><input type="text" size="40" name="address1" value="${sessionScope.account.address1 }"/></td>
	</tr>
	<tr>
		<td>联系地址2:</td>
		<td><input type="text" size="40" name="address2" value="${sessionScope.account.address2 }"/></td>
	</tr>
	<tr>
		<td>城市:</td>
		<td><input type="text" name="city" value="${sessionScope.account.city }"/></td>
	</tr>
	<tr>
		<td>省/州:</td>
		<td><input type="text" size="4" name="state" value="${sessionScope.account.state }"/></td>
	</tr>
	<tr>
		<td>邮编:</td>
		<td><input type="text" size="10" name="zip" value="${sessionScope.account.zip }"/></td>
	</tr>
	<tr>
		<td>国家:</td>
		<td><input type="text" size="15" name="country" value="${sessionScope.account.country }"/></td>
	</tr>
</table>

<h3>偏好设置</h3>

<table>
	<tr>
		<td>首选语言:</td>
		<td>
		<select name="languagePreference">
		   	<c:forEach items="${languages}" var="entry">
            		<option value="${entry.value}" 
            		   <c:if test="${sessionScope.account.languagePreference eq entry.value}">
            		     selected="selected"
            		   </c:if> >${entry.key}</option>
        	</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>最爱宠物类型:</td>
		<td>
		<select name="favouriteCategoryId">
		   <c:forEach items="${categories}" var="entry">
		      <option value="${entry.value}"
		   		<c:if test="${sessionScope.account.favouriteCategoryId eq entry.value}">
		   			selected="selected"
            	</c:if> >${entry.key}</option>
		   </c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>是否展示MyList</td>
		<td>
		<c:if test="${sessionScope.account.isListOption}" >
			<input type="radio" name="isListOption" value="true" checked="checked"/>是&nbsp;&nbsp;
			<input type="radio" name="isListOption" value="false" />否
		</c:if>
		<c:if test="${!sessionScope.account.isListOption}" >
			<input type="radio" name="isListOption" value="true"/>是&nbsp;&nbsp;
			<input type="radio" name="isListOption" value="false" checked="checked"/>否
		</c:if>
		</td>
	</tr>
	<tr>
		<td>是否展示MyBanner</td>
		<td>
		<c:if test="${sessionScope.account.isBannerOption}" >
			<input type="radio" name="isBannerOption" value="true" checked="checked"/>是&nbsp;&nbsp;
			<input type="radio" name="isBannerOption" value="false" />否
		</c:if>
		<c:if test="${!sessionScope.account.isBannerOption}" >
			<input type="radio" name="isBannerOption" value="true"/>是&nbsp;&nbsp;
			<input type="radio" name="isBannerOption" value="false" checked="checked"/>否
		</c:if>
		</td>
	</tr>

</table>
