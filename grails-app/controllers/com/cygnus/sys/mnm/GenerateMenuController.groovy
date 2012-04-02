package com.cygnus.sys.mnm

class GenerateMenuController {

    def index() { 
		def headerList =  SRGroupMenu.findAllByMenuGroup(
							STMenuGroup.findByGroupPosition(
							STMenuGroupPos.findByMenuPositionName(params.pos)
							)
						  )
		
		if(params.pos.equals('top'))render(view:'showHeaderTop',model:[HeaderMenuList:headerList])
		if(params.pos.equals('left'))render(view:'showHeaderLeft',model:[HeaderMenuList:headerList])
		
	}
	
	
	
	def showDetailTop(){
		def detailList = STMenu.findAllByParentMenu(params.parentMenuCode)
		[MenuDetailListTop : detailList]
		
	}
	def showDetailLeft(){
		def detailList = STMenu.findAllByParentMenu(params.parentMenuCode)
		println 'detaillist' + detailList.toString() + params.parentMenuCode
		[MenuDetailListLeft : detailList]
		
	}
}
