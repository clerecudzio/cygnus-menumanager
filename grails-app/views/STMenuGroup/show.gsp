
<%@ page import="com.cygnus.sys.mnm.STMenuGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'STMenuGroup.label', default: 'STMenuGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-STMenuGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-STMenuGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list STMenuGroup">
			
				<g:if test="${STMenuGroupInstance?.groupPosition}">
				<li class="fieldcontain">
					<span id="groupPosition-label" class="property-label"><g:message code="STMenuGroup.groupPosition.label" default="Group Position" /></span>
					
						<span class="property-value" aria-labelledby="groupPosition-label"><g:link controller="STMenuGroupPos" action="show" id="${STMenuGroupInstance?.groupPosition?.id}">${STMenuGroupInstance?.groupPosition?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${STMenuGroupInstance?.menuGroupName}">
				<li class="fieldcontain">
					<span id="menuGroupName-label" class="property-label"><g:message code="STMenuGroup.menuGroupName.label" default="Menu Group Name" /></span>
					
						<span class="property-value" aria-labelledby="menuGroupName-label"><g:fieldValue bean="${STMenuGroupInstance}" field="menuGroupName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${STMenuGroupInstance?.id}" />
					<g:link class="edit" action="edit" id="${STMenuGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
