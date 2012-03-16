package com.cygnus.sys.mnm

import org.springframework.dao.DataIntegrityViolationException

class STMenuGroupPosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [STMenuGroupPosInstanceList: STMenuGroupPos.list(params), STMenuGroupPosInstanceTotal: STMenuGroupPos.count()]
    }

    def create() {
        [STMenuGroupPosInstance: new STMenuGroupPos(params)]
    }

    def save() {
        def STMenuGroupPosInstance = new STMenuGroupPos(params)
        if (!STMenuGroupPosInstance.save(flush: true)) {
            render(view: "create", model: [STMenuGroupPosInstance: STMenuGroupPosInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos'), STMenuGroupPosInstance.id])
        redirect(action: "show", id: STMenuGroupPosInstance.id)
    }

    def show() {
        def STMenuGroupPosInstance = STMenuGroupPos.get(params.id)
        if (!STMenuGroupPosInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos'), params.id])
            redirect(action: "list")
            return
        }

        [STMenuGroupPosInstance: STMenuGroupPosInstance]
    }

    def edit() {
        def STMenuGroupPosInstance = STMenuGroupPos.get(params.id)
        if (!STMenuGroupPosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos'), params.id])
            redirect(action: "list")
            return
        }

        [STMenuGroupPosInstance: STMenuGroupPosInstance]
    }

    def update() {
        def STMenuGroupPosInstance = STMenuGroupPos.get(params.id)
        if (!STMenuGroupPosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (STMenuGroupPosInstance.version > version) {
                STMenuGroupPosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos')] as Object[],
                          "Another user has updated this STMenuGroupPos while you were editing")
                render(view: "edit", model: [STMenuGroupPosInstance: STMenuGroupPosInstance])
                return
            }
        }

        STMenuGroupPosInstance.properties = params

        if (!STMenuGroupPosInstance.save(flush: true)) {
            render(view: "edit", model: [STMenuGroupPosInstance: STMenuGroupPosInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos'), STMenuGroupPosInstance.id])
        redirect(action: "show", id: STMenuGroupPosInstance.id)
    }

    def delete() {
        def STMenuGroupPosInstance = STMenuGroupPos.get(params.id)
        if (!STMenuGroupPosInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos'), params.id])
            redirect(action: "list")
            return
        }

        try {
            STMenuGroupPosInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'STMenuGroupPos.label', default: 'STMenuGroupPos'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
