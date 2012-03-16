
<%@ page import="com.cygnus.sys.mnm.STMenu" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'STMenu.label', default: 'STMenu')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-STMenu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-STMenu" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list STMenu">
			
				<g:if test="${STMenuInstance?.menuCode}">
				<li class="fieldcontain">
					<span id="menuCode-label" class="property-label"><g:message code="STMenu.menuCode.label" default="Menu Code" /></span>
					
						<span class="property-value" aria-labelledby="menuCode-label"><g:fieldValue bean="${STMenuInstance}" field="menuCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${STMenuInstance?.menuPath}">
				<li class="fieldcontain">
					<span id="menuPath-label" class="property-label"><g:message code="STMenu.menuPath.label" default="Menu Path" /></span>
					
						<span class="property-value" aria-labelledby="menuPath-label"><g:fieldValue bean="${STMenuInstance}" field="menuPath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${STMenuInstance?.authority}">
				<li class="fieldcontain">
					<span id="authority-label" class="property-label"><g:message code="STMenu.authority.label" default="Authority" /></span>
					
						<span class="property-value" aria-labelledby="authority-label"><g:link controller="authorities" action="show" id="${STMenuInstance?.authority?.id}">${STMenuInstance?.authority?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${STMenuInstance?.action}">
				<li class="fieldcontain">
					<span id="action-label" class="property-label"><g:message code="STMenu.action.label" default="Action" /></span>
					
						<span class="property-value" aria-labelledby="action-label"><g:fieldValue bean="${STMenuInstance}" field="action"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${STMenuInstance?.parentMenu}">
				<li class="fieldcontain">
					<span id="parentMenu-label" class="property-label"><g:message code="STMenu.parentMenu.label" default="Parent Menu" /></span>
					
						<span class="property-value" aria-labelledby="parentMenu-label"><g:fieldValue bean="${STMenuInstance}" field="parentMenu"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${STMenuInstance?.controller}">
				<li class="fieldcontain">
					<span id="controller-label" class="property-label"><g:message code="STMenu.controller.label" default="Controller" /></span>
					
						<span class="property-value" aria-labelledby="controller-label"><g:fieldValue bean="${STMenuInstance}" field="controller"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${STMenuInstance?.menuOrder}">
				<li class="fieldcontain">
					<span id="menuOrder-label" class="property-label"><g:message code="STMenu.menuOrder.label" default="Menu Order" /></span>
					
						<span class="property-value" aria-labelledby="menuOrder-label"><g:fieldValue bean="${STMenuInstance}" field="menuOrder"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${STMenuInstance?.packageName}">
				<li class="fieldcontain">
					<span id="packageName-label" class="property-label"><g:message code="STMenu.packageName.label" default="Package Name" /></span>
					
						<span class="property-value" aria-labelledby="packageName-label"><g:fieldValue bean="${STMenuInstance}" field="packageName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${STMenuInstance?.id}" />
					<g:link class="edit" action="edit" id="${STMenuInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>