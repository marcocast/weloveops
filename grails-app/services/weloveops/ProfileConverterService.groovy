package weloveops

import grails.transaction.Transactional

import org.grep4j.core.model.Profile
import org.grep4j.core.model.ProfileBuilder

@Transactional
class ProfileConverterService {

	def convertWloProfilesToGrep4jProfiles(wloProfiles) {

		List<Profile> result = []
		wloProfiles.each() { result << convertWloProfileToGrep4jProfile(it) }
		return result
	}

	def convertWloProfileToGrep4jProfile(wloProfile){
		if(wloProfile.url == "localhost"){
			return ProfileBuilder.newBuilder()
			.name(wloProfile.name)
			.filePath(wloProfile.path).onLocalhost().build();
		}else{
			return ProfileBuilder.newBuilder()
			.name(wloProfile.name)
			.filePath(wloProfile.path).onRemotehost(wloProfile.url).credentials(wloProfile.user, wloProfile.password).build();
		}
	}
}





