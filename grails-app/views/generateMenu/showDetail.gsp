<g:if test="${MenuDetailList.size > 0 }">
<ul class="sub">
	<g:each in="${MenuDetailList}" status="i" var="detailInstance">
		<li><a href="#nogo">
			<g:message code="${detailInstance.menuCode}"/></a>
			<g:include controller="generateMenu" action="showDetail" params="[parentMenuCode:"${fieldValue(bean: headerInstance, field: "menuCode")}"]"/>
		</li>
	</g:each>
</ul>
</g:if>