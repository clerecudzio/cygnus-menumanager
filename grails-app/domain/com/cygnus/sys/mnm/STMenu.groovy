package com.cygnus.sys.mnm

import com.cygnus.sys.mnm.STMenu;
import com.cygnus.sys.umgt.Authorities
import com.sun.xml.internal.ws.client.sei.ResponseBuilder.Composite;

class STMenu implements Serializable {


	String menuCode
	String packageName
	int menuOrder
	Authorities authority
	String menuPath
	String action
	String controller

	static belongsTo = [parentMenu:STMenu]
	
	static mapping = { table 'sys_t_menu' 
					   sort menuOrder:"asc"
					   parentMenu lazy:false
					   }
	
	
	static constraints = {
		menuCode unique:true,nullable:false
		menuPath nullable:true
		authority nullable:true
		action nullable:true
		parentMenu nullable:true
		
		
	}

}