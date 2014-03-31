<%@ page import="weloveops.ScheduledSearch" %>



<div class="fieldcontain ${hasErrors(bean: scheduledSearchInstance, field: 'cronExpression', 'error')} ">
	<label for="cronExpression">
		<g:message code="scheduledSearch.cronExpression.label" default="Cron Expression" />
		
	</label>
	<g:textField name="cronExpression" value="${scheduledSearchInstance?.cronExpression}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduledSearchInstance, field: 'expectedLinesFound', 'error')} required">
	<label for="expectedLinesFound">
		<g:message code="scheduledSearch.expectedLinesFound.label" default="Expected Lines Found" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="expectedLinesFound" type="number" value="${scheduledSearchInstance.expectedLinesFound}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduledSearchInstance, field: 'searchParams', 'error')} required">
	<label for="searchParams">
		<g:message code="scheduledSearch.searchParams.label" default="Search Params" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="searchParams" optionKey="id" optionValue="name"
							name="searchParams.id" from="${weloveops.SearchParams.list()}" multiple="false" />
	

</div>

