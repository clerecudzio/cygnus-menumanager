<ul id="nav">
	<g:each in="${HeaderMenuList}" status="i" var="headerInstance">
		<li class="top"><g:if test="${headerInstance.controller}">
				<g:remoteLink controller="${headerInstance.menuCode}"
				update="pageContent" onLoading="loadSpinner();"
						onFailure="handleError(XMLHttpRequest,textStatus,errorThrown);"
					class="top_link">
					<span><g:message code="${headerInstance.menuCode}" /> ${headerInstance.parentMenu}
				</g:remoteLink>
				</span>
			</g:if> <g:else>
			<a href="" class="top_link">
				<span><g:message code="${headerInstance.menuCode}" /></span>
			</a>	
			</g:else> <g:include controller="generateMenu" action="showDetailTop"
				params="[parentMenu:" ${fieldValue(bean: headerInstance, field: "id")}",menuCode:"${headerInstance.menuCode}"]" />
		</li>
	</g:each>
</ul>
