<%@ page import="weloveops.SearchParams" %>



<div class="fieldcontain ${hasErrors(bean: searchParamsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="searchParams.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${searchParamsInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: searchParamsInstance, field: 'profiles', 'error')} ">
	<label for="profiles">
		<g:message code="searchParams.profiles.label" default="Profiles" />
		
	</label>
	<g:select name="profiles" from="${weloveops.WloProfile.list()}" multiple="multiple" optionKey="id" size="5" optionValue="${{it.name}}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: searchParamsInstance, field: 'regex', 'error')} ">
	<label for="regex">
		<g:message code="searchParams.regex.label" default="Regex" />
		
	</label>
	<g:checkBox name="regex" value="${searchParamsInstance?.regex}" />

</div>

<div class="fieldcontain ${hasErrors(bean: searchParamsInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="searchParams.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${searchParamsInstance?.text}"/>

</div>

