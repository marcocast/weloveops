package weloveops


class SearchParams implements Comparable {

	String name
	static hasMany = [profiles: WloProfile]
	boolean regex
	String text
	Date searchDate

	static constraints = {
	}

	int compareTo(Object other) {
		return name.compareTo(other.name);
	}
}
