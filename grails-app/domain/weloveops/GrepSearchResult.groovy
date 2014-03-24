package weloveops;

class GrepSearchResult {

	static hasMany = [results: GrepSearchSingleProfileResult]
	String result
	long totalMatches;

	static constraints =
	{ result(maxSize: 1000000) }
}

