
<%@ page import="com.cygnus.sys.mnm.STMenuGroupPos" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-STMenuGroupPos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-STMenuGroupPos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="menuPositionName" title="${message(code: 'STMenuGroupPos.menuPositionName.label', default: 'Menu Position Name')}" />
					
						<g:sortableColumn property="allowMoreThanOne" title="${message(code: 'STMenuGroupPos.allowMoreThanOne.label', default: 'Allow More Than One')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${STMenuGroupPosInstanceList}" status="i" var="STMenuGroupPosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${STMenuGroupPosInstance.id}">${fieldValue(bean: STMenuGroupPosInstance, field: "menuPositionName")}</g:link></td>
					
						<td><g:formatBoolean boolean="${STMenuGroupPosInstance.allowMoreThanOne}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${STMenuGroupPosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
