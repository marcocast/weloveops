package weloveops;

class GrepSearchResult {

	static hasMany = [results: GrepSearchSingleProfileResult]
	String result
	long totalMatches;
	String text
	Date resultDate
	SearchParams searchParams


	static constraints = {
		result(maxSize: 1000000)
		resultDate defaultValue: "now()"
	}
}

