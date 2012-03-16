
<%@ page import="com.cygnus.sys.mnm.SRGroupMenu" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'SRGroupMenu.label', default: 'SRGroupMenu')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-SRGroupMenu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-SRGroupMenu" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list SRGroupMenu">
			
				<g:if test="${SRGroupMenuInstance?.menu}">
				<li class="fieldcontain">
					<span id="menu-label" class="property-label"><g:message code="SRGroupMenu.menu.label" default="Menu" /></span>
					
						<span class="property-value" aria-labelledby="menu-label"><g:link controller="STMenu" action="show" id="${SRGroupMenuInstance?.menu?.id}">${SRGroupMenuInstance?.menu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${SRGroupMenuInstance?.menuGroup}">
				<li class="fieldcontain">
					<span id="menuGroup-label" class="property-label"><g:message code="SRGroupMenu.menuGroup.label" default="Menu Group" /></span>
					
						<span class="property-value" aria-labelledby="menuGroup-label"><g:link controller="STMenuGroup" action="show" id="${SRGroupMenuInstance?.menuGroup?.id}">${SRGroupMenuInstance?.menuGroup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${SRGroupMenuInstance?.id}" />
					<g:link class="edit" action="edit" id="${SRGroupMenuInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
