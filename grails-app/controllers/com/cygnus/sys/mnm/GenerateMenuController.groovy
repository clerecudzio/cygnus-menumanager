package com.cygnus.sys.mnm

class GenerateMenuController {

    def index() { 
		def headerList =  SRGroupMenu.findAllByMenuGroup(
							STMenuGroup.findByGroupPosition(
							STMenuGroupPos.findByMenuPositionName(params.pos)
							)
						  )
		
		
		render(view:'showHeader',model:[HeaderMenuList:headerList])
	}
	
	
	
	def showDetail(){
		def detailList = STMenu.findAllByParentMenu(params.parentMenuCode)
		[MenuDetailList : detailList]
		
	}
}
