package weloveops

import grails.transaction.Transactional

import com.google.common.collect.Maps

@Transactional
class SchedulerService {

	def configureJob(ScheduledSearch scheduledSearch) {

		SearchAndEmailJob.schedule(scheduledSearch.cronExpression, Maps.newHashMap())
	}
}
