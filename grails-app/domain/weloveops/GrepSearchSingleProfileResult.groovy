package weloveops;

class GrepSearchSingleProfileResult {

	static belongsTo = [grepSearchResult: GrepSearchResult]

	String profileName;
	String fileName;
	String result;
	long totalMatches;

	static constraints =
	{ result(maxSize: 1000000) }
}

