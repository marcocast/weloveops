package weloveops


class SearchParams {

	String name
	static hasMany = [profiles: WloProfile]
	boolean regex
	String text
	Date searchDate

	static constraints = {
	}
}
