package com.cygnus.sys.mnm

class STMenuGroupPos {
	
	String menuPositionName
	boolean allowMoreThanOne = false
	static hasMany = [groupMenus:STMenuGroup]
	
	static constraints = {
		groupMenus nullable:true
		}
	
	static mapping ={
		table 'sys_t_menu_group_pos'
		
	}
	
}
