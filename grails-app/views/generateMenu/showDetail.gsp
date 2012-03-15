<ul>
	<g:each in="${MenuDetailList}" status="i" var="detailInstance">
		<li>
			<g:message code="${detailInstance.menuCode}"/>
			<g:include controller="generateMenu" action="showDetail" params="[parentMenuCode:"${fieldValue(bean: headerInstance, field: "menuCode")}"]"/>
		</li>
	</g:each>
</ul>
