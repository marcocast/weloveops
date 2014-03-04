package weloveops



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WloProfileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
    }

    def show(WloProfile wloProfileInstance) {
        respond wloProfileInstance
    }

    def create() {
        respond new WloProfile(params)
    }

    @Transactional
    def save(WloProfile wloProfileInstance) {
        if (wloProfileInstance == null) {
            notFound()
            return
        }

        if (wloProfileInstance.hasErrors()) {
            respond wloProfileInstance.errors, view:'create'
            return
        }

        wloProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'wloProfileInstance.label', default: 'WloProfile'), wloProfileInstance.id])
                redirect wloProfileInstance
            }
            '*' { respond wloProfileInstance, [status: CREATED] }
        }
    }

    def edit(WloProfile wloProfileInstance) {
        respond wloProfileInstance
    }

    @Transactional
    def update(WloProfile wloProfileInstance) {
        if (wloProfileInstance == null) {
            notFound()
            return
        }

        if (wloProfileInstance.hasErrors()) {
            respond wloProfileInstance.errors, view:'edit'
            return
        }

        wloProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'WloProfile.label', default: 'WloProfile'), wloProfileInstance.id])
                redirect wloProfileInstance
            }
            '*'{ respond wloProfileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(WloProfile wloProfileInstance) {

        if (wloProfileInstance == null) {
            notFound()
            return
        }

        wloProfileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'WloProfile.label', default: 'WloProfile'), wloProfileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'wloProfileInstance.label', default: 'WloProfile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
