<%@ page import="weloveops.WloProfile"%>
<%@ page import="weloveops.SearchParams"%>
<%@ page import="weloveops.GrepSearchResult"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'wloProfile.label', default: 'WloProfile')}" />
<title>text to search</title>

</head>
<body>
	<div class="nav" role="navigation">
		<g:form action="graph" id="formSearch">
			<table>
				<tr class="even">
					<td colspan="2"><g:textField name="searchText" value="" /></td>
				</tr>


				<tr class="odd">
					<td><label for=regex>regex</label></td>
					<td><g:checkBox name="regex" value="${true}" /></td>
				</tr>


				<tr class="even">
					<td><label for=pnames>Select an existing Profile(s)</label></td>
					<td><g:select optionKey="id" optionValue="name" name="pnames"
							from="${wloProfileInstanceList}" multiple="true" /></td>
				</tr>


				<tr class="odd">
					<td><label for="searchnames">Or just select an
							existing search</label></td>
					<td><g:select optionKey="id" optionValue="name"
							name="searchnames" from="${SearchParams.list()}" multiple="false" />
					</td>
				</tr>

				<tr class="even">
					<td colspan="2"><g:submitButton name="graph" value="graph"
							class="buttons" /></td>
				</tr>

			</table>

		</g:form>
		<g:form action="graphOnResults" id="formGraphOnResuls">
			<table>
			
				<tr class="even">
					<td><label for="resultsnames">Or compare existing results</label></td>
					<td><g:select optionKey="id" optionValue="${{it.searchParams.name + '  ' + it.resultDate}}"
							name="resultsnames" from="${GrepSearchResult.list()}" multiple="true" />
					</td>
				</tr>
				

				<tr class="odd">
					<td colspan="2"><g:submitButton name="graph" value="Graph based on existing results"
							class="buttons" /></td>
				</tr>

			</table>

		</g:form>
	</div>
</body>
</html>