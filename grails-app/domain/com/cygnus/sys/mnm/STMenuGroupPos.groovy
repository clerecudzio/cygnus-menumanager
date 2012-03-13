package com.cygnus.sys.mnm

class STMenuGroupPos {
	
	String menuPositionName
	boolean allowMoreThanOne

	static constraints = {
		menuPositionName  unique:true
		}
	
	static mapping ={
		table 'sys_t_menu_group'
		
	}
}
