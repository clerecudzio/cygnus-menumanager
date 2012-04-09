<a tabindex="0" href="#news-items"
	class="fg-button fg-button-icon-right ui-widget ui-state-default ui-corner-all"
	id="hierarchy"><span class="ui-icon ui-icon-triangle-1-s"></span>
<g:message code="cygnus.onScreenMenu" /></a>
<div id="news-items" class="hidden">
	<ul>
		<g:each in="${HeaderMenuList}" status="i" var="headerInstance">
			<li><g:if test="${headerInstance.controller}">
					<g:remoteLink controller="${headerInstance.menuCode}" 
					update="pageContent" onLoading="loadSpinner();"
						onFailure="handleError(XMLHttpRequest,textStatus,errorThrown);">
						<g:message code="${headerInstance.menuCode}" />
					</g:remoteLink>
				</g:if> <g:else>
					<a href=""> <g:message code="${headerInstance.menuCode}" />
					</a>
				</g:else> <g:include controller="generateMenu" action="showDetailLeft"
					params="[parentMenu:" ${fieldValue(bean: headerInstance, field: "id")}",menuCode:"${headerInstance.menuCode}"]" />
			</li>
		</g:each>
	</ul>
</div>

