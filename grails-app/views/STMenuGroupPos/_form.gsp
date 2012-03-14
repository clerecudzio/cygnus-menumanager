<%@ page import="com.cygnus.sys.mnm.STMenuGroupPos" %>



<div class="fieldcontain ${hasErrors(bean: STMenuGroupPosInstance, field: 'menuPositionName', 'error')} ">
	<label for="menuPositionName">
		<g:message code="STMenuGroupPos.menuPositionName.label" default="Menu Position Name" />
		
	</label>
	<g:textField name="menuPositionName" value="${STMenuGroupPosInstance?.menuPositionName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuGroupPosInstance, field: 'allowMoreThanOne', 'error')} ">
	<label for="allowMoreThanOne">
		<g:message code="STMenuGroupPos.allowMoreThanOne.label" default="Allow More Than One" />
		
	</label>
	<g:checkBox name="allowMoreThanOne" value="${STMenuGroupPosInstance?.allowMoreThanOne}" />
</div>

