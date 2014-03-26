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

	def getSearchParam(params) {

		SearchParams searchParams;

		if(params.list("searchnames") != null && !params.list("searchnames").isEmpty()){
			searchParams= SearchParams.getAll(params.list("searchnames")).first()
		}else{
			searchParams = mapToSearchParams(params)
			if(SearchParams.findByName(searchParams.name) == null){
				searchParams.save()
			}
		}

		return searchParams
	}
}