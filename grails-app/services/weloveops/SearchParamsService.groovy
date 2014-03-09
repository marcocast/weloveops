package weloveops

import grails.transaction.Transactional

@Transactional
class SearchParamsService {


	def saveSearchParams(params) {

		SearchParams searchParams = new SearchParams(name: params.searchname,regex: params.regex, text: params.searchText)

		for(WloProfile profile :  WloProfile.getAll(params.list("pnames"))){
			searchParams.addToProfiles(profile)
		}



		searchParams.save();
	}
}
