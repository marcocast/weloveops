<%@ page import="weloveops.WloProfile"%>
<%@ page import="weloveops.SearchParams"%>
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
					<td><label for="savesearch">do you want to save this
							search?</label></td>
					<td><g:checkBox name="savesearch" value="${false}" /></td>
				</tr>



				<tr class="even">
					<td><label for="savesearch">i should just appear if
							you click before :( </label></td>
					<td><g:textField name="searchname"
							value="enter search name here" /></td>
				</tr>



				<tr class="odd">
					<td><label for="searchnames">Or just select an
							existing search</label></td>
					<td><g:select optionKey="id" optionValue="name"
							name="searchnames" from="${SearchParams.list()}" multiple="false" />
					</td>
				</tr>

				<tr class="even">
					<td colspan="2"><g:submitButton name="execute" value="graph"
							class="buttons" /></td>
				</tr>

			</table>

		</g:form>
	</div>
</body>
</html>