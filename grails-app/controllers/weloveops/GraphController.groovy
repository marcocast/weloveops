package weloveops

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on

class GraphController {


	weloveops.ProfileConverterService profileConverterService;
	weloveops.SearchParamsService searchParamsService;

	def graph() {
	}

	def render = {
		def myDailyActivitiesColumns = [
			['string', 'Task'],
			['number', 'Hours per Day']
		]
		def myDailyActivitiesData = [
			['Work', 11],
			['Eat', 2],
			['Commute', 2],
			['Watch TV', 2],
			['Sleep', 7]
		]
		render template: "chart", model: ["myDailyActivitiesColumns": myDailyActivitiesColumns,
			"myDailyActivitiesData": myDailyActivitiesData]
	}


	def index() {
		respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
	}
}
