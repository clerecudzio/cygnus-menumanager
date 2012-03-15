package com.cygnus.sys.mnm

class GenerateMenuController {

    def index() { 
		def headerList =  SRGroupMenu.findAllByMenuGroup(
							STMenuGroup.findByGroupPosition(
							STMenuGroupPos.findByMenuPositionName(params.pos)
							)
						  )
		headerList.each{ headerNode ->
			
		}
		
		render(view:'showHeader',model:[HeaderMenuList:headerList])
	}
	
	
	
	def showDetail(){
		log.info "finding sub menu of ${params.parentMenuCode}"
		def detailList = STMenu.findAllByParentMenu(params.parentMenuCode)
		[MenuDetailList : detailList]
		
	}
}
