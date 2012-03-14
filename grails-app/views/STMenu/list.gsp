
<%@ page import="com.cygnus.sys.mnm.STMenu" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'STMenu.label', default: 'STMenu')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-STMenu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-STMenu" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="menuCode" title="${message(code: 'STMenu.menuCode.label', default: 'Menu Code')}" />
					
						<g:sortableColumn property="menuPath" title="${message(code: 'STMenu.menuPath.label', default: 'Menu Path')}" />
					
						<th><g:message code="STMenu.authority.label" default="Authority" /></th>
					
						<g:sortableColumn property="action" title="${message(code: 'STMenu.action.label', default: 'Action')}" />
					
						<g:sortableColumn property="parentMenu" title="${message(code: 'STMenu.parentMenu.label', default: 'Parent Menu')}" />
					
						<g:sortableColumn property="controller" title="${message(code: 'STMenu.controller.label', default: 'Controller')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${STMenuInstanceList}" status="i" var="STMenuInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${STMenuInstance.id}">${fieldValue(bean: STMenuInstance, field: "menuCode")}</g:link></td>
					
						<td>${fieldValue(bean: STMenuInstance, field: "menuPath")}</td>
					
						<td>${fieldValue(bean: STMenuInstance, field: "authority")}</td>
					
						<td>${fieldValue(bean: STMenuInstance, field: "action")}</td>
					
						<td>${fieldValue(bean: STMenuInstance, field: "parentMenu")}</td>
					
						<td>${fieldValue(bean: STMenuInstance, field: "controller")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${STMenuInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
