
<%@ page import="weloveops.GrepSearchResult" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grepSearchResult.label', default: 'GrepSearchResult')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-grepSearchResult" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-grepSearchResult" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list grepSearchResult">
			
				<g:if test="${grepSearchResultInstance?.totalMatches}">
				<li class="fieldcontain">
					<span id="totalMatches-label" class="property-label"><g:message code="grepSearchResult.totalMatches.label" default="Total Matches" /></span>
					
						<span class="property-value" aria-labelledby="totalMatches-label"><g:fieldValue bean="${grepSearchResultInstance}" field="totalMatches"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${grepSearchResultInstance?.result}">
				<li class="fieldcontain">
					<span id="result-label" class="property-label"><g:message code="grepSearchResult.result.label" default="Result" /></span>
					
						<span class="property-value" aria-labelledby="result-label"><g:fieldValue bean="${grepSearchResultInstance}" field="result"/></span>
					
				</li>
				</g:if>
			
			
			</ol>
			
		</div>
	</body>
</html>
