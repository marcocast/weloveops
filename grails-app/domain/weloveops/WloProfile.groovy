package weloveops

class WloProfile {

	String name;
	String url;
	String path;
	String user;
	String password;

	static constraints = {
		name blank: false, nullable: true, unique: true
		url nullable: false, blank: false
		path nullable: true
		password nullable: true
		user nullable: true
	}
}
