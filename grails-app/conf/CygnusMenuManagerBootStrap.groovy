
import com.cygnus.sys.mnm.STMenu
import com.cygnus.sys.mnm.STMenuGroup
import com.cygnus.sys.mnm.STMenuGroupPos
import org.codehaus.groovy.grails.commons.DefaultGrailsControllerClass


class CygnusMenuManagerBootStrap {
	def grailsApplication
	def init = { servletContext ->
		environments{
			development{
				/**
				 * Generate default menu from all controllers 
				 */


				/**
				 * Create groupPos
				 */
				new STMenuGroupPos(menuPositionName:"top",allowMoreThanOne:false).save(failOnError:true)
				new STMenuGroupPos(menuPositionName:"left",allowMoreThanOne:true).save(failOnError:true)
				
				/**
				 * Create groupMenu	and assign position
				 */

				def menuGroup = new STMenuGroup(menuGroupName:"mainMenu",groupPosition:STMenuGroupPos.findByMenuPositionName("top")).save(failOnError:true)
				def leftMenuGroup = new STMenuGroup(menuGroupName:"mainMenu",groupPosition:STMenuGroupPos.findByMenuPositionName("left")).save(failOnError:true)
				

				//				/**
				//				 * Generate first level menu
				//				 */
				//				new STMenu(menuCode:'userManagement',controller: '#',action:'#',packageName:'#',menuLevel:0).save(failOnError:true)
				//				new STMenu(menuCode:'contentManagement',controller: '#',action:'#',packageName:'#',menuLevel:0).save(failOnError:true)
				//				new STMenu(menuCode:'systemConfiguration',controller: '#',action:'#',packageName:'#',menuLevel:0).save(failOnError:true)
				//				new STMenu(menuCode:'about',controller: '#',action:'#',packageName:'#',menuLevel:0).save(failOnError:true)

				/**
				 * Generate to SRGroupMenu
				 *
				new SRGroupMenu(menu:STMenu.findByMenuCode('home')?:new STMenu(menuCode:'home',controller: '#',action:'#',packageName:'#',menuOrder:1).save(failOnError:true)
						,menuGroup:STMenuGroup.findByMenuGroupName('mainMenu')).save(failOnError:true)
				new SRGroupMenu(menu:STMenu.findByMenuCode('userManagement')?:new STMenu(menuCode:'userManagement',controller: '#',action:'#',packageName:'#',menuOrder:3).save(failOnError:true)
						,menuGroup:STMenuGroup.findByMenuGroupName('mainMenu')).save(failOnError:true)
				new SRGroupMenu(menu:STMenu.findByMenuCode('contentManagement')?:new STMenu(menuCode:'contentManagement',controller: '#',action:'#',packageName:'#',menOrder:2).save(failOnError:true)
						,menuGroup:STMenuGroup.findByMenuGroupName('mainMenu')).save(failOnError:true)
				new SRGroupMenu(menu:STMenu.findByMenuCode('about')?:new STMenu(menuCode:'about',controller: '#',action:'#',packageName:'#',menuOrder:4).save(failOnError:true)
						,menuGroup:STMenuGroup.findByMenuGroupName('mainMenu')).save(failOnError:true)
				new SRGroupMenu(menu:STMenu.findByMenuCode('systemConfiguration')?:new STMenu(menuCode:'systemConfiguration',controller: '#',action:'#',packageName:'#',menuOrder:1).save(failOnError:true)
						,menuGroup:STMenuGroup.findByMenuGroupName('mainMenu')).save(failOnError:true)
				new SRGroupMenu(menu:STMenu.findByMenuCode('reportManagement')?:new STMenu(menuCode:'reportManagement',controller: '#',action:'#',packageName:'#',menuOrder:1).save(failOnError:true)
							,menuGroup:STMenuGroup.findByMenuGroupName('mainMenu')).save(failOnError:true)

				**/
				menuGroup.addToStMenu(new STMenu(menuCode:'home',controller: '',action:'#',packageName:'#',menuOrder:1))
				.save(failOnError:true)
				leftMenuGroup.addToStMenu(new STMenu(menuCode:'management',controller: '',action:'#',packageName:'#',menuOrder:3).save(failOnError:true))
				.save(failOnError:true)
				
				new STMenu(menuCode:'userManagement',controller: '',action:'#',packageName:'#',menuOrder:3,parentMenu:STMenu.findByMenuCode('management')).save(failOnError:true)
				new STMenu(menuCode:'contentManagement',controller: '',action:'#',packageName:'#',menOrder:2,parentMenu:STMenu.findByMenuCode('management')).save(failOnError:true)
				new STMenu(menuCode:'reportManagement',controller: '',action:'#',packageName:'#',menuOrder:1,parentMenu:STMenu.findByMenuCode('management')).save(failOnError:true)
				
				menuGroup.addToStMenu(new STMenu(menuCode:'systemConfiguration',controller: '',action:'#',packageName:'#',menuOrder:2).save(failOnError:true))
				.save(failOnError:true)
				
				menuGroup.addToStMenu(new STMenu(menuCode:'about',controller: '',action:'',packageName:'#',menuOrder:3).save(failOnError:true))
				.save(failOnError:true)
				menuGroup.addToStMenu(new STMenu(menuCode:'notAssigned',controller: '',action:'',packageName:'#',menuOrder:4).save(failOnError:true))
				.save(failOnError:true)
				
				
				
				grailsApplication.controllerClasses.each{ gc ->
					def controllerClass = gc.getClazz()
					def cClass = new DefaultGrailsControllerClass(controllerClass)
					def parentMenuCode
					if(cClass.properties.packageName.equals('com.cygnus.sys.umgt')) parentMenuCode = 'userManagement'
					else if(cClass.properties.packageName.equals('com.cygnus.sys')) parentMenuCode = 'systemConfiguration'
					else if(cClass.properties.packageName.equals('com.cygnus.sys.mnm')) parentMenuCode = 'systemConfiguration'
					else if(cClass.properties.packageName.equals('com.cygnus.sys.rpt')) parentMenuCode = 'reportManagement'
					else parentMenuCode = 'notAssigned'
					
					def menu = new STMenu(
							menuCode:cClass.properties.logicalPropertyName,
							controller: cClass.properties.fullName,
							packageName: cClass.properties.packageName,
							action:cClass.properties.defaultAction,
							parentMenu:STMenu.findByMenuCode(parentMenuCode)?:new STMenu(menuCode:parentMenuCode,controller: '#',action:'#',packageName:'#',menuOrder:1).save(failOnError:true),
							menuPath:'/'+cClass.properties.logicalPropertyName+'/**',
							menuLevel:1
							).save(failOnError:true)
				}





			}
			test{
			}
			production{
			}
		}
	}
	def destroy = {
	}
}
