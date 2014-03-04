<!DOCTYPE html>
<html>
	<head>
		<title>result page</title>
		<meta name="layout" content="main">
		<g:if env="development"><link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css"></g:if>
	</head>
<body>
<g:textArea  name="result" value="${grepsearchResult.result}" rows="${grepsearchResult.totalMatches}" cols="1"/>
</body>
</html>