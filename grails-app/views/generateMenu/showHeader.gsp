<ul>
	<g:each in="${HeaderMenuList}" status="i" var="headerInstance">
		<li>
			<g:message code="${headerInstance.menu.menuCode}"/>
			<g:include controller="generateMenu" action="showDetail" params="[parentMenuCode:"${fieldValue(bean: headerInstance, field: "menu.menuCode")}"]" />
		</li>
	</g:each>
</ul>
