package weloveops;

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on

class SearchController {

	weloveops.GrepService grepService;
	weloveops.SearchParamsService searchParamsService;

	def executeSearch(){

		GrepSearchResult grepsearchResult = grepService.grepBasedOnSearchParams(params)

		print GrepSearchResult.list()

		render (template: "result", model: [grepsearchResult: grepsearchResult])
	}



	def search() {

		[ searchParams:searchParamsService.getSearchParam(params) ]
	}


	def index() {
		respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
	}
}
