dataSource {
	pooled = true
	jmxExport = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password = ""
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
	//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/WELOVEOPS?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = ""
		}
	}
	test {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/WELOVEOPS?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = ""
		}
	}
	production {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/WELOVEOPS?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = ""
		}
	}
}

