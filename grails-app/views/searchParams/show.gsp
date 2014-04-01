
<%@ page import="weloveops.SearchParams" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
<r:require modules="bootstrap" />
		<g:set var="entityName" value="${message(code: 'searchParams.label', default: 'SearchParams')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-searchParams" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-searchParams" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list searchParams">
			
				<g:if test="${searchParamsInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="searchParams.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${searchParamsInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${searchParamsInstance?.profiles}">
				<li class="fieldcontain">
					<span id="profiles-label" class="property-label"><g:message code="searchParams.profiles.label" default="Profiles" /></span>
					
						<g:each in="${searchParamsInstance.profiles}" var="p">
						<span class="property-value" aria-labelledby="profiles-label"><g:link controller="wloProfile" action="show" id="${p.id}">${p.name}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${searchParamsInstance?.regex}">
				<li class="fieldcontain">
					<span id="regex-label" class="property-label"><g:message code="searchParams.regex.label" default="Regex" /></span>
					
						<span class="property-value" aria-labelledby="regex-label"><g:formatBoolean boolean="${searchParamsInstance?.regex}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${searchParamsInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="searchParams.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${searchParamsInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:searchParamsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${searchParamsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
