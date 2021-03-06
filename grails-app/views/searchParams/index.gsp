
<%@ page import="weloveops.SearchParams" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
<r:require modules="bootstrap" />
		<g:set var="entityName" value="${message(code: 'searchParams.label', default: 'SearchParams')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-searchParams" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-searchParams" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'searchParams.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="regex" title="${message(code: 'searchParams.regex.label', default: 'Regex')}" />
					
						<g:sortableColumn property="text" title="${message(code: 'searchParams.text.label', default: 'Text')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${searchParamsInstanceList}" status="i" var="searchParamsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${searchParamsInstance.id}">${fieldValue(bean: searchParamsInstance, field: "name")}</g:link></td>
					
						<td><g:formatBoolean boolean="${searchParamsInstance.regex}" /></td>
					
						<td>${fieldValue(bean: searchParamsInstance, field: "text")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${searchParamsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
