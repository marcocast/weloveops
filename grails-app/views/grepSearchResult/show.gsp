
<%@ page import="weloveops.GrepSearchResult"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'grepSearchResult.label', default: 'GrepSearchResult')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-grepSearchResult" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<table class="result">
			<g:each in="${grepSearchResultInstanceList}" status="index" var="result">
				<g:each in="${result.results}" status="i" var="singleResult">
					<div role="main" class="result">
						<table class="result">
							<tr>
								<td><label for="result">File : ${singleResult.fileName}
										, Total lines found : ${singleResult.totalMatches}
								</label></td>
							</tr>
							<tr>
								<td><g:textArea name="result"
										value="${singleResult.result}"
										rows="${singleResult.totalMatches}" cols="1" /></td>
							</tr>
						</table>
					</div>
				</g:each>
			</g:each>
		</table>
	</div>
</body>
</html>
