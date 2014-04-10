package weloveops

import grails.transaction.Transactional



@Transactional
class SearchParamsService {


	def mapToSearchParams(params){

		String searchParamName = params.searchText + " on "

		SearchParams searchParams = new SearchParams(name: searchParamName,regex: params.regex, text: params.searchText)
		searchParams.searchDate = new Date()
		for(WloProfile profile :  WloProfile.getAll(params.list("pnames"))){
			searchParams.addToProfiles(profile)
			searchParams.name = searchParams.name + " " + profile.name + " - "
		}

		return searchParams
	}

	def getSearchParam(params) {

		SearchParams searchParams;

		if(params.list("searchnames") != null && !params.list("searchnames").isEmpty() && params.searchnames != "none"){
			searchParams = SearchParams.getAll(params.list("searchnames")).first()
			searchParams = SearchParams.findByName(searchParams.name)
			searchParams.searchDate = new Date()
			searchParams.save()
		}else{
			searchParams = mapToSearchParams(params)
			searchParams.save()
			searchParams = SearchParams.findByName(searchParams.name)
			searchParams.searchDate = new Date()
			searchParams.save()
		}

		return searchParams
	}
}
