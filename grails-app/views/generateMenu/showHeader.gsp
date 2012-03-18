<ul id="nav">
	<g:each in="${HeaderMenuList}" status="i" var="headerInstance">
		<li class="top"><a href="#nogo" class="top_link">
			<span><g:message code="${headerInstance.menu.menuCode}"/></a></span>
			<g:include controller="generateMenu" action="showDetail" params="[parentMenuCode:"${fieldValue(bean: headerInstance, field: "menu.menuCode")}"]" />
		</li>
	</g:each>
</ul>
