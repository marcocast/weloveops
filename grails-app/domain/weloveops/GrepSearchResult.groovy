package weloveops;

class GrepSearchResult {

	String result;
	long totalMatches;

	static constraints =
	{ result(maxSize: 1000000) }
}

