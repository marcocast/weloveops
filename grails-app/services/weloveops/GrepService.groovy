package weloveops

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on
import grails.transaction.Transactional

import org.grep4j.core.model.Profile
import org.grep4j.core.request.GrepExpression
import org.grep4j.core.result.GrepResult
import org.grep4j.core.result.GrepResults

@Transactional
class GrepService {

	weloveops.ProfileConverterService profileConverterService;

	def grepBasedOnSearchParams(params) {

		boolean regex = false
		def selectedWloProfiles = null
		String searchText = null

		SearchParams searchParams = SearchParams.findByName(params.name)

		regex = searchParams.regex

		if(params.profileName != null && params.profileName != ""){
			print "params.profileNameparams.profileNameparams.profileName"
			selectedWloProfiles = WloProfile.findByName(params.profileName)
		}else{
			selectedWloProfiles =  searchParams.profiles
		}
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
		grepsearchResult.searchParams = searchParams


		for(GrepResult grepResult : results){
			GrepSearchSingleProfileResult singleResult = new GrepSearchSingleProfileResult()
			singleResult.result = grepResult.text
			singleResult.profileName = grepResult.getProfileName()
			singleResult.fileName = grepResult.getFileName()
			singleResult.totalMatches = grepResult.totalLines()
			grepsearchResult.addToResults(singleResult)
		}

		grepsearchResult.save()

		return grepsearchResult
	}
}
