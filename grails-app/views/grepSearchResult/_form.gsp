<%@ page import="weloveops.GrepSearchResult" %>



<div class="fieldcontain ${hasErrors(bean: grepSearchResultInstance, field: 'result', 'error')} ">
	<label for="result">
		<g:message code="grepSearchResult.result.label" default="Result" />
		
	</label>
	<g:textArea name="result" cols="40" rows="5" maxlength="1000000" value="${grepSearchResultInstance?.result}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: grepSearchResultInstance, field: 'results', 'error')} ">
	<label for="results">
		<g:message code="grepSearchResult.results.label" default="Results" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${grepSearchResultInstance?.results?}" var="r">
    <li><g:link controller="grepSearchSingleProfileResult" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="grepSearchSingleProfileResult" action="create" params="['grepSearchResult.id': grepSearchResultInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'grepSearchSingleProfileResult.label', default: 'GrepSearchSingleProfileResult')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: grepSearchResultInstance, field: 'totalMatches', 'error')} required">
	<label for="totalMatches">
		<g:message code="grepSearchResult.totalMatches.label" default="Total Matches" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalMatches" type="number" value="${grepSearchResultInstance.totalMatches}" required=""/>

</div>

