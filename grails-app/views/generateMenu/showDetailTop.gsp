<g:if test="${MenuDetailListTop.size > 0 }">
<ul class="sub">
	<g:each in="${MenuDetailListTop}" status="i" var="detailInstance">
		<li><g:remoteLink controller="${detailInstance.menuCode}" update="pageContent" onLoading="loadSpinner();" onFailure="handleError(XMLHttpRequest,textStatus,errorThrown);">
			<g:message code="${detailInstance.menuCode}"/></g:remoteLink></a>
			<g:include controller="generateMenu" action="showDetailTop" params="[parentMenuCode:"${fieldValue(bean: headerInstance, field: "menuCode")}"]"/>
		</li>
	</g:each>
</ul>
</g:if>