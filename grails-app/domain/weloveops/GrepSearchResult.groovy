package weloveops;

class GrepSearchResult implements Comparable {

	static hasMany = [results: GrepSearchSingleProfileResult]
	String result
	long totalMatches;
	String text
	Date resultDate
	SearchParams searchParams

	static constraints = {
		result blank: true, nullable: true
		result(maxSize: 1000000)
		resultDate defaultValue: "now()"
	}



	int compareTo(Object other) {
		if((searchParams.id <=> other.searchParams.id) == 0 && results.unique(false) == other.results){
			return resultDate.compareTo(other.resultDate);
		}else{
			return 1;
		}
	}
}

