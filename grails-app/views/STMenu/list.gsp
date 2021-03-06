
<%@ page import="com.cygnus.sys.mnm.STMenu" %>
<!doctype html>
<html>
<!-- Generated by Cygnus-templateEngine -->
	<head>
		<meta name="layout" content="cygnus-forms">
		<g:set var="entityName" value="${message(code: 'STMenu.label', default: 'STMenu')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<parameter name="pageEName" value="STMenu" />
	</head>
	<body>
	<g:formRemote name="showSearchForm" update="pageContent"
		url="[controller:'STMenu', action:'cygnusFilteredSearch']">
		<g:include action="generateSearch" controller="universalSearch"
			params="[dcName:'STMenu',
					strings:[01:['menuCode','controller'],
							 02:['parentMenu','menuPath']],
					string:[01:['packageName']]
							]" />
	</g:formRemote>
		<a href="#list-STMenu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
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
					
						<g:sortableColumn property="menuCode" params="${params}" title="${message(code: 'STMenu.menuCode.label', default: 'Menu Code')}"  />
					
						<g:sortableColumn property="menuPath" params="${params}" title="${message(code: 'STMenu.menuPath.label', default: 'Menu Path')}"  />
					
						<th><g:message code="STMenu.authority.label" default="Authority" /></th>
					
						<g:sortableColumn property="action" params="${params}" title="${message(code: 'STMenu.action.label', default: 'Action')}"  />
					
						<th><g:message code="STMenu.parentMenu.label" default="Parent Menu" /></th>
					
						<g:sortableColumn property="controller" params="${params}" title="${message(code: 'STMenu.controller.label', default: 'Controller')}"  />
					
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
			<g:if test="${params.action == 'list' }">
				<g:paginate total="{STMenuInstanceTotal}" />
			</g:if>
			<g:else>
				<g:paginate total="STMenuInstanceTotal}"
					action="cygnusFilteredSearch"
					params="${params}"
					max="${params.max}"/>
			</g:else>
		</div>
		</div>
	</body>
</html>
