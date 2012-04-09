<a tabindex="0" href="#news-items" class="fg-button fg-button-icon-right ui-widget ui-state-default ui-corner-all" id="hierarchy"><span class="ui-icon ui-icon-triangle-1-s"></span>ipod-style menu w/ "back" link</a>
<div id="news-items" class="hidden">
<ul>
	<g:each in="${HeaderMenuList}" status="i" var="headerInstance">
	<g:if test="${headerInstance.controller}">
		<li><g:link controller="${headerInstance.controller}">
			<g:message code="${headerInstance.menuCode}"/> ${headerInstance.parentMenu}</g:link>
			</g:if>
			<g:else><a href="">
			<span><g:message code="${headerInstance.menuCode}"/> ${headerInstance.parentMenu}</span>
			</a>
			</g:else>
			<g:include controller="generateMenu" action="showDetailLeft" params="[parentMenu:"${fieldValue(bean: headerInstance, field: "id")}",menuCode:"${headerInstance.menuCode}"]" />
		</li>
	</g:each>
</ul>
</div>

