package weloveops



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SearchParamsController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond SearchParams.list(params), model:[searchParamsInstanceCount: SearchParams.count()]
	}

	def show(SearchParams searchParamsInstance) {
		respond searchParamsInstance
	}

	def create() {
		respond new SearchParams(params)
	}

	@Transactional
	def save(SearchParams searchParamsInstance) {
		if (searchParamsInstance == null) {
			notFound()
			return
		}

		if (searchParamsInstance.hasErrors()) {
			respond searchParamsInstance.errors, view:'create'
			return
		}

		searchParamsInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'searchParamsInstance.label', default: 'SearchParams'),
					searchParamsInstance.id
				])
				redirect searchParamsInstance
			}
			'*' { respond searchParamsInstance, [status: CREATED] }
		}
	}

	def edit(SearchParams searchParamsInstance) {
		respond searchParamsInstance
	}

	@Transactional
	def update(SearchParams searchParamsInstance) {
		if (searchParamsInstance == null) {
			notFound()
			return
		}

		if (searchParamsInstance.hasErrors()) {
			respond searchParamsInstance.errors, view:'edit'
			return
		}

		searchParamsInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'SearchParams.label', default: 'SearchParams'),
					searchParamsInstance.id
				])
				redirect searchParamsInstance
			}
			'*'{ respond searchParamsInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(SearchParams searchParamsInstance) {

		if (searchParamsInstance == null) {
			notFound()
			return
		}

		searchParamsInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'SearchParams.label', default: 'SearchParams'),
					searchParamsInstance.id
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
					message(code: 'searchParamsInstance.label', default: 'SearchParams'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
