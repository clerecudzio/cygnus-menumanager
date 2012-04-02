<g:if test="${MenuDetailListTop.size > 0 }">
<ul class="sub">
	<g:each in="${MenuDetailListTop}" status="i" var="detailInstance">
		<li><g:link controller="${detailInstance.menuCode}">
			<g:message code="${detailInstance.menuCode}"/></g:link></a>
			<g:include controller="generateMenu" action="showDetailTop" params="[parentMenuCode:"${fieldValue(bean: headerInstance, field: "menuCode")}"]"/>
		</li>
	</g:each>
</ul>
</g:if>