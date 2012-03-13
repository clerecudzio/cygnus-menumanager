package com.cygnus.sys.mnm

import com.cygnus.sys.mnm.STMenu;
import com.cygnus.sys.umgt.Authorities

class STMenu implements Serializable {


	String menuCode
	String packageName
	int menuLevel
	Authorities authority
	String menuPath
	STMenu parentMenu
	String action
	String controller

	static mapping = { table 'sys_t_menu' 
					   id composite:['controller','action']
					   }

	static constraints = {
		menuCode unique:true
		menuPath nullable:true
		authority nullable:true
		action nullable:true
		parentMenu nullable:true
		
	}

}