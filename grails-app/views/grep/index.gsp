<%@ page import="weloveops.WloProfile"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'wloProfile.label', default: 'WloProfile')}" />
<title>text to search</title>
</head>
<body>
	<g:form action="search">
		<g:textField name="searchText" value="" />
		 <label for="searchText">regex</label>
		<g:checkBox name="regex" value="${true}"  />
		<g:select optionKey="id" optionValue="name" name="pnames"
			from="${wloProfileInstanceList}" multiple="true" />
		<g:submitButton name="execute" value="search" class="buttons" />
	</g:form>
</body>
</html>