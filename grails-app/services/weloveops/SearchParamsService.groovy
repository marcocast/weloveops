package weloveops

import grails.transaction.Transactional

@Transactional
class SearchParamsService {


	def mapToSearchParams(params){

		String searchParamName = params.searchText + " on "

		SearchParams searchParams = new SearchParams(name: searchParamName,regex: params.regex, text: params.searchText)

		for(WloProfile profile :  WloProfile.getAll(params.list("pnames"))){
			searchParams.addToProfiles(profile)
			searchParams.name += profile.name + " - "
		}

		return searchParams
	}
}
