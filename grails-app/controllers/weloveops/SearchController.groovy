package weloveops;

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on

import org.grep4j.core.model.Profile
import org.grep4j.core.request.GrepExpression
import org.grep4j.core.result.GrepResult
import org.grep4j.core.result.GrepResults

class SearchController {

	weloveops.ProfileConverterService profileConverterService;
	weloveops.SearchParamsService searchParamsService;


	def executeSearch(){

		boolean regex = false
		def selectedWloProfiles = null
		String searchText = null


		regex = params.regex
		selectedWloProfiles = WloProfile.findByName(params.profileName)
		searchText = params.text

		List<Profile> profiles = profileConverterService.convertWloProfilesToGrep4jProfiles(selectedWloProfiles)

		GrepExpression grepExpression;

		if (regex){
			grepExpression = regularExpression(searchText)
		}else{
			grepExpression = constantExpression(searchText)
		}

		GrepResults results = grep(grepExpression, on(profiles));

		GrepSearchResult grepsearchResult = new GrepSearchResult(result: results.toString() ,totalMatches: results.totalLines())


		for(GrepResult grepResult : results){
			GrepSearchSingleProfileResult singleResult = new GrepSearchSingleProfileResult()
			singleResult.result = grepResult.text
			singleResult.name = grepResult.getProfileName()
			singleResult.totalMatches = grepResult.totalLines()

			grepsearchResult.addToResults(singleResult)
		}

		grepsearchResult.save()

		render (template: "result", model: [grepsearchResult: grepsearchResult])
	}



	def search() {

		SearchParams searchParams = searchParamsService.mapToSearchParams(params)

		if(params.savesearch){
			searchParams.save()
		}

		[ searchParams:searchParams ]
	}


	def index() {
		respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
	}
}
