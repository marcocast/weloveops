package weloveops



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GrepSearchResultController {



	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)

		respond GrepSearchResult.list(params).unique(), model:[grepSearchResultInstanceCount: GrepSearchResult.list(params).unique().size()]
	}

	def show(SearchParams searchParams) {
		respond GrepSearchResult.executeQuery("select a from GrepSearchResult a " +
				"where a.searchParams.id = ? and a.resultDate = ?",
				[
					searchParams.id,
					searchParams.searchDate
				])
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
