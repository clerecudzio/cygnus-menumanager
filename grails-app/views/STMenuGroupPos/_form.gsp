<%@ page import="com.cygnus.sys.mnm.STMenuGroupPos" %>



<div class="fieldcontain ${hasErrors(bean: STMenuGroupPosInstance, field: 'groupMenus', 'error')} ">
	<label for="groupMenus">
		<g:message code="STMenuGroupPos.groupMenus.label" default="Group Menus" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${STMenuGroupPosInstance?.groupMenus?}" var="g">
    <li><g:link controller="STMenuGroup" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="STMenuGroup" action="create" params="['STMenuGroupPos.id': STMenuGroupPosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: STMenuGroupPosInstance, field: 'allowMoreThanOne', 'error')} ">
	<label for="allowMoreThanOne">
		<g:message code="STMenuGroupPos.allowMoreThanOne.label" default="Allow More Than One" />
		
	</label>
	<g:checkBox name="allowMoreThanOne" value="${STMenuGroupPosInstance?.allowMoreThanOne}" />
</div>

<div class="fieldcontain ${hasErrors(bean: STMenuGroupPosInstance, field: 'menuPositionName', 'error')} ">
	<label for="menuPositionName">
		<g:message code="STMenuGroupPos.menuPositionName.label" default="Menu Position Name" />
		
	</label>
	<g:textField name="menuPositionName" value="${STMenuGroupPosInstance?.menuPositionName}"/>
</div>

