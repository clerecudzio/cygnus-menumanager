<ul id="nav">
	<g:each in="${HeaderMenuList}" status="i" var="headerInstance">
		<li class="top"><g:link controller="${headerInstance.menu.controller}" class="top_link">
			<span><g:message code="${headerInstance.menu.menuCode}"/></g:link></span>
			<g:include controller="generateMenu" action="showDetailTop" params="[parentMenuCode:"${fieldValue(bean: headerInstance, field: "menu.menuCode")}"]" />
		</li>
	</g:each>
</ul>
