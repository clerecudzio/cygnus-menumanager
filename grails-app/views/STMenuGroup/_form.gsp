<%@ page import="com.cygnus.sys.mnm.STMenuGroup" %>



<div class="fieldcontain ${hasErrors(bean: STMenuGroupInstance, field: 'groupPosition', 'error')} required">
	<label for="groupPosition">
		<g:message code="STMenuGroup.groupPosition.label" default="Group Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="groupPosition" name="groupPosition.id" from="${com.cygnus.sys.mnm.STMenuGroupPos.list()}" optionKey="id" required="" value="${STMenuGroupInstance?.groupPosition?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuGroupInstance, field: 'menuGroupName', 'error')} ">
	<label for="menuGroupName">
		<g:message code="STMenuGroup.menuGroupName.label" default="Menu Group Name" />
		
	</label>
	<g:textField name="menuGroupName" value="${STMenuGroupInstance?.menuGroupName}"/>
</div>

