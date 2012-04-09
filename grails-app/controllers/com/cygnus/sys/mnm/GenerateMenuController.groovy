package com.cygnus.sys.mnm

class GenerateMenuController {

    def index() { 
		def headerList =  STMenuGroup.findByGroupPosition(
							STMenuGroupPos.findByMenuPositionName(params.pos)
							)
		def results = headerList.stMenu.sort{it.menuOrder}
		
		
		
		
		if(params.pos.equals('top'))render(view:'showHeaderTop',model:[HeaderMenuList:results])
		if(params.pos.equals('left'))render(view:'showHeaderLeft',model:[HeaderMenuList:results])
		
	}
	
	def generateOnScreenMenu(){
		def currentMenu = STMenu.findByMenuCode(params.menuCode)
		def parentMenu = currentMenu.parentMenu
		def result = STMenu.findAllByParentMenu(parentMenu)
		render(view:'showHeaderLeft',model:[HeaderMenuList:result])
		
	}
	
	
	
	def showDetailTop(){
		log.info "params = "+params
		def detailList = []
		if(params.parentMenu){
		detailList = STMenu.findAllByParentMenu(STMenu.get(params.parentMenu),[sort:"menuOrder"])
		log.info "Parameters = ${params} -> child menus = ${detailList}" 
		}
		[MenuDetailListTop : detailList,MenuDetailListTopSize:detailList?detailList.size:0]
		
		
		
	}
	def showDetailLeft(){
		log.info "params = "+params
		def detailList = []
		if(params.parentMenu){
		detailList = STMenu.findAllByParentMenu(STMenu.get(params.parentMenu),[sort:"menuOrder"])
		log.info "Parameters = ${params} -> child menus = ${detailList}" 
		
		
		}
		[MenuDetailListTop : detailList,MenuDetailListTopSize:detailList?detailList.size:0]
		
		
		
	}
}
