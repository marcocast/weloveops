<!DOCTYPE html>
<html>
<head>
<title>result page</title>
<meta name="layout" content="main">
</head>
<body>

	<g:each in="${grepsearchResult.results}" status="i" var="singleResult">
	

				<div role="main" class="result">
				    <label for="result">${singleResult.name}</label>
					<g:textArea name="result" value="${singleResult.result}"
						rows="${singleResult.totalMatches}" cols="1" />
				</div>


	
	</g:each>





</body>
</html>