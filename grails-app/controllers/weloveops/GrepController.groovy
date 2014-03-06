package weloveops;

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on

import org.grep4j.core.model.Profile
import org.grep4j.core.request.GrepExpression
import org.grep4j.core.result.GrepResult
import org.grep4j.core.result.GrepResults

class GrepController {

	weloveops.ProfileConverterService profileConverterService;

	def search() {

		def selectedWloProfiles = WloProfile.getAll(params.list("pnames"))

		List<Profile> profiles = profileConverterService.convertWloProfilesToGrep4jProfiles(selectedWloProfiles)

		GrepExpression grepExpression;

		if (params.regex){
			grepExpression = regularExpression(params.searchText)
		}else{
			grepExpression = constantExpression(params.searchText)
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

		[ grepsearchResult:grepsearchResult ]
	}


	def index() {
		params.max = 100
		respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
	}
}
