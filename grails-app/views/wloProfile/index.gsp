<%@ page import="weloveops.WloProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wloProfile.label', default: 'WloProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-wloProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-wloProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'wloProfile.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'wloProfile.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="path" title="${message(code: 'wloProfile.path.label', default: 'Path')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'wloProfile.url.label', default: 'Url')}" />
					
						<g:sortableColumn property="user" title="${message(code: 'wloProfile.user.label', default: 'User')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${wloProfileInstanceList}" status="i" var="wloProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${wloProfileInstance.id}">${fieldValue(bean: wloProfileInstance, field: "name")}</g:link></td>
						<g:if test="${wloProfileInstance?.password}">
							<td>*********</td>
						</g:if>
						<g:else>
						     <td></td>
						</g:else>
						<td>${fieldValue(bean: wloProfileInstance, field: "path")}</td>
					
						<td>${fieldValue(bean: wloProfileInstance, field: "url")}</td>
					
						<td>${fieldValue(bean: wloProfileInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${wloProfileInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
