package com.cygnus.sys.mnm

import org.springframework.dao.DataIntegrityViolationException

class SRGroupMenuController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [SRGroupMenuInstanceList: SRGroupMenu.list(params), SRGroupMenuInstanceTotal: SRGroupMenu.count()]
    }

    def create() {
        [SRGroupMenuInstance: new SRGroupMenu(params)]
    }

    def save() {
        def SRGroupMenuInstance = new SRGroupMenu(params)
        if (!SRGroupMenuInstance.save(flush: true)) {
            render(view: "create", model: [SRGroupMenuInstance: SRGroupMenuInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu'), SRGroupMenuInstance.id])
        redirect(action: "show", id: SRGroupMenuInstance.id)
    }

    def show() {
        def SRGroupMenuInstance = SRGroupMenu.get(params.id)
        if (!SRGroupMenuInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu'), params.id])
            redirect(action: "list")
            return
        }

        [SRGroupMenuInstance: SRGroupMenuInstance]
    }

    def edit() {
        def SRGroupMenuInstance = SRGroupMenu.get(params.id)
        if (!SRGroupMenuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu'), params.id])
            redirect(action: "list")
            return
        }

        [SRGroupMenuInstance: SRGroupMenuInstance]
    }

    def update() {
        def SRGroupMenuInstance = SRGroupMenu.get(params.id)
        if (!SRGroupMenuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (SRGroupMenuInstance.version > version) {
                SRGroupMenuInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu')] as Object[],
                          "Another user has updated this SRGroupMenu while you were editing")
                render(view: "edit", model: [SRGroupMenuInstance: SRGroupMenuInstance])
                return
            }
        }

        SRGroupMenuInstance.properties = params

        if (!SRGroupMenuInstance.save(flush: true)) {
            render(view: "edit", model: [SRGroupMenuInstance: SRGroupMenuInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu'), SRGroupMenuInstance.id])
        redirect(action: "show", id: SRGroupMenuInstance.id)
    }

    def delete() {
        def SRGroupMenuInstance = SRGroupMenu.get(params.id)
        if (!SRGroupMenuInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu'), params.id])
            redirect(action: "list")
            return
        }

        try {
            SRGroupMenuInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'SRGroupMenu.label', default: 'SRGroupMenu'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
