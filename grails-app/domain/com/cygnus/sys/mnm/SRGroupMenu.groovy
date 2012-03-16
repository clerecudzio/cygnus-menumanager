package com.cygnus.sys.mnm

class SRGroupMenu implements Serializable {
	STMenu menu
	STMenuGroup menuGroup
	static constraints = {
	}
	static mapping ={
		table  'sr_group_menu'

		orderBy: ['menu.menuOrder']
	}

	static hasMany = [menu:STMenu,menuGroup:STMenuGroup]
}
