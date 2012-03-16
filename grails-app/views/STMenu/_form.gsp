<%@ page import="com.cygnus.sys.mnm.STMenu" %>



<div class="fieldcontain ${hasErrors(bean: STMenuInstance, field: 'menuCode', 'error')} ">
	<label for="menuCode">
		<g:message code="STMenu.menuCode.label" default="Menu Code" />
		
	</label>
	<g:textField name="menuCode" value="${STMenuInstance?.menuCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuInstance, field: 'menuPath', 'error')} ">
	<label for="menuPath">
		<g:message code="STMenu.menuPath.label" default="Menu Path" />
		
	</label>
	<g:textField name="menuPath" value="${STMenuInstance?.menuPath}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuInstance, field: 'authority', 'error')} ">
	<label for="authority">
		<g:message code="STMenu.authority.label" default="Authority" />
		
	</label>
	<g:select id="authority" name="authority.id" from="${com.cygnus.sys.umgt.Authorities.list()}" optionKey="id" value="${STMenuInstance?.authority?.id}" class="many-to-one" noSelection="['null': '']" optionValue="authority"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuInstance, field: 'action', 'error')} ">
	<label for="action">
		<g:message code="STMenu.action.label" default="Action" />
		
	</label>
	<g:textField name="action" value="${STMenuInstance?.action}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuInstance, field: 'parentMenu', 'error')} ">
	<label for="parentMenu">
		<g:message code="STMenu.parentMenu.label" default="Parent Menu" />
		
	</label>
	<g:textField name="parentMenu" value="${STMenuInstance?.parentMenu}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuInstance, field: 'controller', 'error')} ">
	<label for="controller">
		<g:message code="STMenu.controller.label" default="Controller" />
		
	</label>
	<g:textField name="controller" value="${STMenuInstance?.controller}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuInstance, field: 'menuOrder', 'error')} required">
	<label for="menuOrder">
		<g:message code="STMenu.menuOrder.label" default="Menu Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="menuOrder" required="" value="${fieldValue(bean: STMenuInstance, field: 'menuOrder')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuInstance, field: 'packageName', 'error')} ">
	<label for="packageName">
		<g:message code="STMenu.packageName.label" default="Package Name" />
		
	</label>
	<g:textField name="packageName" value="${STMenuInstance?.packageName}"/>
</div>

