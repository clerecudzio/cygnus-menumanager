<%@ page import="com.cygnus.sys.mnm.SRGroupMenu" %>



<div class="fieldcontain ${hasErrors(bean: SRGroupMenuInstance, field: 'menu', 'error')} required">
	<label for="menu">
		<g:message code="SRGroupMenu.menu.label" default="Menu" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="menu" name="menu.id" from="${com.cygnus.sys.mnm.STMenu.list()}" optionKey="id" required="" value="${SRGroupMenuInstance?.menu?.id}" class="many-to-one" optionValue="menu.menuCode"/>
</div>

<div class="fieldcontain ${hasErrors(bean: SRGroupMenuInstance, field: 'menuGroup', 'error')} required">
	<label for="menuGroup">
		<g:message code="SRGroupMenu.menuGroup.label" default="Menu Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="menuGroup" name="menuGroup.id" from="${com.cygnus.sys.mnm.STMenuGroup.list()}" optionKey="id" required="" value="${SRGroupMenuInstance?.menuGroup?.id}" class="many-to-one" optionValue="menuGroup.menuGroupName"/>
</div>

