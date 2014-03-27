package weloveops

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on

class GraphController {


	weloveops.GrepService grepService;
	weloveops.SearchParamsService searchParamsService;



	def execute() {


		GrepSearchResult grepsearchResult = grepService.grepBasedOnSearchParams(params)

		def myDailyActivitiesColumns = [
			["string", "Profile - File"],
			["number", "lines found"]
		]

		def myDailyActivitiesData = [];

		for(GrepSearchSingleProfileResult singleResult : grepsearchResult.results){

			myDailyActivitiesData.add([
				(singleResult.profileName + " - " +singleResult.fileName),
				singleResult.totalMatches
			])
		}


		render template: "chart", model: ["myDailyActivitiesColumns": myDailyActivitiesColumns,	"myDailyActivitiesData": myDailyActivitiesData]
	}

	def graph() {

		[ searchParams:searchParamsService.getSearchParam(params) ]
	}


	def index() {
		respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
	}
}
