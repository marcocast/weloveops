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
				(singleResult.grepSearchResult.searchParams.name + " - " +singleResult.fileName),
				singleResult.totalMatches
			])
		}


		render template: "chart", model: ["myDailyActivitiesColumns": myDailyActivitiesColumns,	"myDailyActivitiesData": myDailyActivitiesData]
	}

	def executeOnResults() {


		def myDailyActivitiesColumns = [
			["string", "Profile - File"],
			["number", "lines found"]
		]

		def myDailyActivitiesData = [];


		for(Long id : getIds(params)){
			GrepSearchResult foundResult = GrepSearchResult.findById(id)

			if(foundResult != null){

				for(GrepSearchSingleProfileResult singleResult : foundResult.results){

					myDailyActivitiesData.add([
						(singleResult.grepSearchResult.searchParams.name + " - " +singleResult.fileName),
						singleResult.totalMatches
					])
				}
			}
		}



		render template: "chart", model: ["myDailyActivitiesColumns": myDailyActivitiesColumns,	"myDailyActivitiesData": myDailyActivitiesData]
	}

	def getIds(params){
		List<Long> allIds = new ArrayList<Long>();


		String theId = "";
		for(char one : params.selectedresultsnames.toCharArray()){

			if(isNumeric(one)){
				theId += one
			}else if(one == ',' || one == ']'){
				allIds.add(new Long(theId))
				theId=""
			}
		}

		return allIds
	}


	def boolean isNumeric(char str) {
		try {
			double d = Double.parseDouble(String.valueOf(str));
		}
		catch(NumberFormatException nfe) {
			return false;
		}
		return true;
	}



	def graph() {

		[ searchParams:searchParamsService.getSearchParam(params) ]
	}

	def graphOnResults() {
		[ resultsnames:params.resultsnames ]
	}




	def index() {
		respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
	}
}
