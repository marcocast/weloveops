package weloveops



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GrepSearchResultController {



	def index() {
		respond GrepSearchResult.list(params).unique(), model:[grepSearchResultInstanceCount: GrepSearchResult.list(params).unique().size()]
	}

	def show(GrepSearchResult grepSearchResultInstance) {
		respond grepSearchResultInstance
	}



	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'grepSearchResultInstance.label', default: 'GrepSearchResult'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
