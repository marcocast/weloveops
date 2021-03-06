
<%@ page import="weloveops.GrepSearchResult"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'grepSearchResult.label', default: 'GrepSearchResult')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-grepSearchResult" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>

	<div id="list-grepSearchResult" class="content scaffold-list"
		role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="resultDate" title="Result date" />

					<g:sortableColumn property="searchName" title="Full Search Name" />
					
					<g:sortableColumn property="profileName" title="Profile Name" />
					
					<g:sortableColumn property="fileName" title="File Name" />
					
					<g:sortableColumn property="result"
						title="${message(code: 'grepSearchResult.result.label', default: 'Result')}" />
					
					

					<g:sortableColumn property="totalMatches"
						title="${message(code: 'grepSearchResult.totalMatches.label', default: 'Total Matches')}" />

				


				</tr>
			</thead>
			<tbody>
				<g:each in="${grepSearchResultInstanceList}" status="i"
					var="grepSearchResultInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>
							${fieldValue(bean: grepSearchResultInstance, field: "resultDate")}
						</td>

						<td><g:each in="${grepSearchResultInstance.searchParams}"
								status="sinlge" var="searchParams">
								<g:link controller="searchParams" action="show"
									id="${fieldValue(bean: searchParams, field: "id")}">
									${fieldValue(bean: searchParams, field: "name")}
								</g:link>

							</g:each></td>
							
						
						<td>
							<g:each in="${grepSearchResultInstance.results}"
								status="sinlge" var="singleResult">
								${fieldValue(bean: singleResult, field: "profileName")}
							</g:each>
						</td>
						
						<td>
							<g:each in="${grepSearchResultInstance.results}"
								status="sinlge" var="singleResult">
								${fieldValue(bean: singleResult, field: "fileName")}
							</g:each>
						</td>

						<td>
							${fieldValue(bean: grepSearchResultInstance, field: "totalMatches")}
						</td>

						<td><g:link action="show"
									id="${fieldValue(bean: grepSearchResultInstance, field: "id")}">Show result</g:link>
						</td>


					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${grepSearchResultInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
