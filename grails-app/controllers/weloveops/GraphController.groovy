package weloveops

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on

import org.grep4j.core.model.Profile
import org.grep4j.core.request.GrepExpression
import org.grep4j.core.result.GrepResult
import org.grep4j.core.result.GrepResults

class GraphController {


	weloveops.ProfileConverterService profileConverterService;
	weloveops.SearchParamsService searchParamsService;



	def execute() {
		boolean regex = false
		def selectedWloProfiles = null
		String searchText = null


		print "name="+ params.name

		SearchParams searchParams = SearchParams.findByName(params.name)

		regex = searchParams.regex
		selectedWloProfiles =  searchParams.profiles
		searchText = searchParams.text


		List<Profile> profiles = profileConverterService.convertWloProfilesToGrep4jProfiles(selectedWloProfiles)

		GrepExpression grepExpression;

		if (regex){
			grepExpression = regularExpression(searchText)
		}else{
			grepExpression = constantExpression(searchText)
		}

		GrepResults results = grep(grepExpression, on(profiles));

		GrepSearchResult grepsearchResult = new GrepSearchResult(result: results.toString() ,totalMatches: results.totalLines())
		grepsearchResult.text = searchText
		grepsearchResult.resultDate = new Date()

		def myDailyActivitiesColumns = [
			["string", "Profile"],
			["number", "lines found"]
		]

		def myDailyActivitiesData = [];

		for(GrepResult grepResult : results){
			GrepSearchSingleProfileResult singleResult = new GrepSearchSingleProfileResult()
			singleResult.result = grepResult.text
			singleResult.name = grepResult.getProfileName()
			singleResult.totalMatches = grepResult.totalLines()

			grepsearchResult.addToResults(singleResult)

			myDailyActivitiesData.add([
				grepResult.getProfileName(),
				grepResult.totalLines()
			])
		}

		grepsearchResult.save()


		render template: "chart", model: ["myDailyActivitiesColumns": myDailyActivitiesColumns,	"myDailyActivitiesData": myDailyActivitiesData]
	}

	def graph() {

		[ searchParams:searchParamsService.getSearchParam(params) ]
	}


	def index() {
		respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
	}
}
