package weloveops;

class GrepSearchSingleProfileResult {

	static belongsTo = [grepSearchResult: GrepSearchResult]

	String name;
	String result;
	long totalMatches;

	static constraints =
	{ result(maxSize: 1000000) }
}

