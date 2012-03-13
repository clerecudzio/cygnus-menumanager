import com.cygnus.sys.mnm.STMenu
import org.codehaus.groovy.grails.commons.DefaultGrailsControllerClass


class CygnusMenuManagerBootStrap {
	def grailsApplication
	def init = { servletContext ->
		environments{
			development{
				/**
				 * Generate default menu from all controllers 
				 */

				grailsApplication.controllerClasses.each{ gc ->
					def controllerClass = gc.getClazz()
					def cClass = new DefaultGrailsControllerClass(controllerClass)
					def menu = new STMenu(
							menuCode:cClass.properties.logicalPropertyName,
							controller: cClass.properties.fullName,
							packageName: cClass.properties.packageName,
							action:cClass.properties.defaultAction,
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
