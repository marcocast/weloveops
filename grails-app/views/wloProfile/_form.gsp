<%@ page import="weloveops.WloProfile" %>



<div class="fieldcontain ${hasErrors(bean: wloProfileInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="wloProfile.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${wloProfileInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wloProfileInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="wloProfile.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${wloProfileInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wloProfileInstance, field: 'path', 'error')} ">
	<label for="path">
		<g:message code="wloProfile.path.label" default="Path" />
		
	</label>
	<g:textField name="path" value="${wloProfileInstance?.path}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wloProfileInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="wloProfile.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${wloProfileInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wloProfileInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="wloProfile.user.label" default="User" />
		
	</label>
	<g:textField name="user" value="${wloProfileInstance?.user}"/>

</div>

