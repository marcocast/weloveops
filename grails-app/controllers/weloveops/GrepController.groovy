package weloveops;

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.fluent.Dictionary.on

import org.grep4j.core.model.Profile
import org.grep4j.core.model.ProfileBuilder
import org.grep4j.core.result.GrepResults

class GrepController {

	def search() {

		def checkedBooks = params.list("pnames")
		def selectedBooks = WloProfile.getAll(checkedBooks)



		WloProfile profile = selectedBooks[0]

		Profile localProfile = ProfileBuilder.newBuilder()
				.name(profile.name)
				.filePath(profile.path)
				.onLocalhost()
				.build();

		GrepResults results = grep(constantExpression(params.searchText), on(localProfile));

		GrepSearchResult grepsearchResult = new GrepSearchResult(result: results.toString() ,totalMatches: results.totalLines())

		grepsearchResult.save()

		[ grepsearchResult:grepsearchResult ]
	}


	def index() {

		params.max = 100
		respond WloProfile.list(params), model:[wloProfileInstanceCount: WloProfile.count()]
	}
}
