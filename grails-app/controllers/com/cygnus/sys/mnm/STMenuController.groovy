package com.cygnus.sys.mnm

import grails.converters.JSON

import org.apache.jasper.compiler.Node.ParamsAction;
import org.springframework.dao.DataIntegrityViolationException

class STMenuController {
	def universalSearchService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def JSONUtilService
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [STMenuInstanceList: STMenu.list(params), STMenuInstanceTotal: STMenu.count()]
    }

    def create() {
        [STMenuInstance: new STMenu(params)]
    }

    def save() {
        def STMenuInstance = new STMenu(params)
        if (!STMenuInstance.save(flush: true)) {
            render(view: "create", model: [STMenuInstance: STMenuInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'STMenu.label', default: 'STMenu'), STMenuInstance.id])
        redirect(action: "show", id: STMenuInstance.id)
    }

    def show() {
        def STMenuInstance = STMenu.get(params.id)
        if (!STMenuInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenu.label', default: 'STMenu'), params.id])
            redirect(action: "list")
            return
        }

        [STMenuInstance: STMenuInstance]
    }

    def edit() {
        def STMenuInstance = STMenu.get(params.id)
        if (!STMenuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenu.label', default: 'STMenu'), params.id])
            redirect(action: "list")
            return
        }

        [STMenuInstance: STMenuInstance]
    }

    def update() {
        def STMenuInstance = STMenu.get(params.id)
        if (!STMenuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenu.label', default: 'STMenu'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (STMenuInstance.version > version) {
                STMenuInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'STMenu.label', default: 'STMenu')] as Object[],
                          "Another user has updated this STMenu while you were editing")
                render(view: "edit", model: [STMenuInstance: STMenuInstance])
                return
            }
        }

        STMenuInstance.properties = params

        if (!STMenuInstance.save(flush: true)) {
            render(view: "edit", model: [STMenuInstance: STMenuInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'STMenu.label', default: 'STMenu'), STMenuInstance.id])
        redirect(action: "show", id: STMenuInstance.id)
    }

    def delete() {
        def STMenuInstance = STMenu.get(params.id)
        if (!STMenuInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenu.label', default: 'STMenu'), params.id])
            redirect(action: "list")
            return
        }

        try {
            STMenuInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'STMenu.label', default: 'STMenu'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'STMenu.label', default: 'STMenu'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	/**
	 * Required in ReportController
	 */
	def listMenuCodeAsJson = {
		def result = STMenu.withCriteria{
			ilike 'menuCode', params.term + '%'
		}
		render JSONUtilService.transformToStandardizedJSONFormat(result,['id','menuCode','menuCode'],['controller']) as JSON
	}
	
	def cygnusFilteredSearch(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		log.info "params = "+params.toString();
		def result = universalSearchService.generateResult(params)
		render (view:"list",model: [STMenuInstanceList: result.resultList, STMenuInstanceTotal: result.resultListSize])
	}
}
