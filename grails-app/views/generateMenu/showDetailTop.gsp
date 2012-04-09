<g:if test="${MenuDetailListTopSize > 0 }">
	<ul class="sub">
		<g:each in="${MenuDetailListTop}" status="i" var="detailInstance">
			<li><g:if test="${detailInstance.controller}">
					<g:remoteLink controller="${detailInstance.menuCode}"
						update="pageContent" onLoading="loadSpinner();"
						onFailure="handleError(XMLHttpRequest,textStatus,errorThrown);">
						<g:message code="${detailInstance.menuCode}" />
					</g:remoteLink>
					
				</g:if> <g:else>
					<a href=""><g:message code="${detailInstance.menuCode}" /></a>
				</g:else> <g:include controller="generateMenu" action="showDetailTop"
					params="[parentMenu:" ${fieldValue(bean: detailInstance, field: "id")}",menuCode:"${detailInstance.menuCode}"]"/>

			</li>
		</g:each>
	</ul>
</g:if>