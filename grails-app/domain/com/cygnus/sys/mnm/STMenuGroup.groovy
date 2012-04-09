package com.cygnus.sys.mnm

class STMenuGroup {
	String menuGroupName
	
	
    static constraints = {
    }
	
	static mapping = { table 'sys_t_menu_group'}
	
	static hasMany = [stMenu:STMenu]
	static belongsTo = [groupPosition:STMenuGroupPos]
}
