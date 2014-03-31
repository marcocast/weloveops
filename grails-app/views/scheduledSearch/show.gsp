
<%@ page import="weloveops.ScheduledSearch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'scheduledSearch.label', default: 'ScheduledSearch')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-scheduledSearch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-scheduledSearch" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list scheduledSearch">
			
				<g:if test="${scheduledSearchInstance?.cronExpression}">
				<li class="fieldcontain">
					<span id="cronExpression-label" class="property-label"><g:message code="scheduledSearch.cronExpression.label" default="Cron Expression" /></span>
					
						<span class="property-value" aria-labelledby="cronExpression-label"><g:fieldValue bean="${scheduledSearchInstance}" field="cronExpression"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduledSearchInstance?.expectedLinesFound}">
				<li class="fieldcontain">
					<span id="expectedLinesFound-label" class="property-label"><g:message code="scheduledSearch.expectedLinesFound.label" default="Expected Lines Found" /></span>
					
						<span class="property-value" aria-labelledby="expectedLinesFound-label"><g:fieldValue bean="${scheduledSearchInstance}" field="expectedLinesFound"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduledSearchInstance?.searchParams}">
				<li class="fieldcontain">
					<span id="searchParams-label" class="property-label"><g:message code="scheduledSearch.searchParams.label" default="Search Params" /></span>
					
						<span class="property-value" aria-labelledby="searchParams-label"><g:link controller="searchParams" action="show" id="${scheduledSearchInstance?.searchParams?.id}">${scheduledSearchInstance?.searchParams?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:scheduledSearchInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${scheduledSearchInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
