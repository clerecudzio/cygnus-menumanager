package com.cygnus.sys.mnm

import org.springframework.dao.DataIntegrityViolationException

class STMenuGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [STMenuGroupInstanceList: STMenuGroup.list(params), STMenuGroupInstanceTotal: STMenuGroup.count()]
    }

    def create() {
        [STMenuGroupInstance: new STMenuGroup(params)]
    }

    def save() {
        def STMenuGroupInstance = new STMenuGroup(params)
        if (!STMenuGroupInstance.save(flush: true)) {
            render(view: "create", model: [STMenuGroupInstance: STMenuGroupInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup'), STMenuGroupInstance.id])
        redirect(action: "show", id: STMenuGroupInstance.id)
    }

    def show() {
        def STMenuGroupInstance = STMenuGroup.get(params.id)
        if (!STMenuGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup'), params.id])
            redirect(action: "list")
            return
        }

        [STMenuGroupInstance: STMenuGroupInstance]
    }

    def edit() {
        def STMenuGroupInstance = STMenuGroup.get(params.id)
        if (!STMenuGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup'), params.id])
            redirect(action: "list")
            return
        }

        [STMenuGroupInstance: STMenuGroupInstance]
    }

    def update() {
        def STMenuGroupInstance = STMenuGroup.get(params.id)
        if (!STMenuGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (STMenuGroupInstance.version > version) {
                STMenuGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'STMenuGroup.label', default: 'STMenuGroup')] as Object[],
                          "Another user has updated this STMenuGroup while you were editing")
                render(view: "edit", model: [STMenuGroupInstance: STMenuGroupInstance])
                return
            }
        }

        STMenuGroupInstance.properties = params

        if (!STMenuGroupInstance.save(flush: true)) {
            render(view: "edit", model: [STMenuGroupInstance: STMenuGroupInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup'), STMenuGroupInstance.id])
        redirect(action: "show", id: STMenuGroupInstance.id)
    }

    def delete() {
        def STMenuGroupInstance = STMenuGroup.get(params.id)
        if (!STMenuGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup'), params.id])
            redirect(action: "list")
            return
        }

        try {
            STMenuGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'STMenuGroup.label', default: 'STMenuGroup'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
