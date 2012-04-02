<g:if test="${MenuDetailListLeft.size > 0 }">
<ul>
	<g:each in="${MenuDetailListLeft}" status="i" var="detailInstance">
		<li><a href="#nogo">
			<g:message code="${detailInstance.menuCode}"/></a>
			<g:include controller="generateMenu" action="showDetailLeft" params="[parentMenuCode:"${fieldValue(bean: headerInstance, field: "menuCode")}"]"/>
		</li>
	</g:each>
</ul>
</g:if>