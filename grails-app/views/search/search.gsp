<!DOCTYPE html>
<html>
<head>
<title>result page</title>
<meta name="layout" content="main">
</head>
<body>
	<div class="nav" role="navigation">

		<g:each in="${grepsearchResult.results}" status="i" var="singleResult">
			<div role="main" class="result">
				<table class="result">
					<tr>
						<td><label for="result">On Profile ${singleResult.name}
								found ${singleResult.totalMatches} lines
						</label></td>
					</tr>
					<tr>
						<td><g:textArea name="result" value="${singleResult.result}"
								rows="${singleResult.totalMatches}" cols="1" /></td>
					</tr>
				</table>


			</div>
		</g:each>
	</div>
</body>
</html>