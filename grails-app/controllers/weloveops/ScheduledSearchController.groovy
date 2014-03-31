package weloveops



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ScheduledSearchController {

	def  SchedulerService  schedulerService

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond ScheduledSearch.list(params), model:[scheduledSearchInstanceCount: ScheduledSearch.count()]
	}

	def show(ScheduledSearch scheduledSearchInstance) {
		respond scheduledSearchInstance
	}

	def create() {
		respond new ScheduledSearch(params)
	}

	@Transactional
	def save(ScheduledSearch scheduledSearchInstance) {
		if (scheduledSearchInstance == null) {
			notFound()
			return
		}

		if (scheduledSearchInstance.hasErrors()) {
			respond scheduledSearchInstance.errors, view:'create'
			return
		}

		scheduledSearchInstance.save flush:true

		schedulerService.configureJob(scheduledSearchInstance)

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'scheduledSearchInstance.label', default: 'ScheduledSearch'),
					scheduledSearchInstance.id
				])
				redirect scheduledSearchInstance
			}
			'*' { respond scheduledSearchInstance, [status: CREATED] }
		}
	}

	def edit(ScheduledSearch scheduledSearchInstance) {
		respond scheduledSearchInstance
	}

	@Transactional
	def update(ScheduledSearch scheduledSearchInstance) {
		if (scheduledSearchInstance == null) {
			notFound()
			return
		}

		if (scheduledSearchInstance.hasErrors()) {
			respond scheduledSearchInstance.errors, view:'edit'
			return
		}

		scheduledSearchInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'ScheduledSearch.label', default: 'ScheduledSearch'),
					scheduledSearchInstance.id
				])
				redirect scheduledSearchInstance
			}
			'*'{ respond scheduledSearchInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(ScheduledSearch scheduledSearchInstance) {

		if (scheduledSearchInstance == null) {
			notFound()
			return
		}

		scheduledSearchInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'ScheduledSearch.label', default: 'ScheduledSearch'),
					scheduledSearchInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'scheduledSearchInstance.label', default: 'ScheduledSearch'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
