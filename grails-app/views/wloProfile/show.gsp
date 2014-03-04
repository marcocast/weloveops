
<%@ page import="weloveops.WloProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wloProfile.label', default: 'WloProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wloProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wloProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wloProfile">
			
				<g:if test="${wloProfileInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="wloProfile.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${wloProfileInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wloProfileInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="wloProfile.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${wloProfileInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wloProfileInstance?.path}">
				<li class="fieldcontain">
					<span id="path-label" class="property-label"><g:message code="wloProfile.path.label" default="Path" /></span>
					
						<span class="property-value" aria-labelledby="path-label"><g:fieldValue bean="${wloProfileInstance}" field="path"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wloProfileInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="wloProfile.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${wloProfileInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wloProfileInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="wloProfile.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${wloProfileInstance}" field="user"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:wloProfileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${wloProfileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
