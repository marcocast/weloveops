
<%@ page import="weloveops.ScheduledSearch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'scheduledSearch.label', default: 'ScheduledSearch')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-scheduledSearch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><a class="home" href="${createLink(uri: '/quartz/list')}">See created jobs</a></li>			</ul>
		</div>
		<div id="list-scheduledSearch" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cronExpression" title="${message(code: 'scheduledSearch.cronExpression.label', default: 'Cron Expression')}" />
					
						<g:sortableColumn property="expectedLinesFound" title="${message(code: 'scheduledSearch.expectedLinesFound.label', default: 'Expected Lines Found')}" />
					
						<th><g:message code="scheduledSearch.searchParams.label" default="Search Params" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${scheduledSearchInstanceList}" status="i" var="scheduledSearchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${scheduledSearchInstance.id}">${fieldValue(bean: scheduledSearchInstance, field: "cronExpression")}</g:link></td>
					
						<td>${fieldValue(bean: scheduledSearchInstance, field: "expectedLinesFound")}</td>
					
						<td>${fieldValue(bean: scheduledSearchInstance, field: "searchParams")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${scheduledSearchInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
