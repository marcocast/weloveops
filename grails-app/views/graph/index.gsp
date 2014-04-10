<%@ page import="weloveops.WloProfile"%>
<%@ page import="weloveops.SearchParams"%>
<%@ page import="weloveops.GrepSearchResult"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'wloProfile.label', default: 'WloProfile')}" />
<title>text to search</title>

</head>
<body>
	<div class="row">
		<div class="col-lg-6">
			<div class="form-group">

				<g:form action="graph" id="formSearch">



					<div class="form-group">
						<label>Search Text</label> <input class="form-control"
							name="searchText" placeholder="Enter text">
					</div>
					<div class="form-group">

						<div class="checkbox">
							<label> <g:checkBox name="regex" value="${true}" />I'm
								using a regular expression text
							</label>
						</div>
					</div>

					<div class="form-group">
						<label>Select profile(s)</label>
						<g:select class="form-control" optionKey="id" optionValue="name"
							name="pnames" from="${wloProfileInstanceList}" multiple="true" />
					</div>


					<div class="form-group">
						<label>Or just select a search that you want to replay</label> <select
							class="form-control" optionKey="id" optionValue="name"
							name="searchnames">
							<option value="none"></option>
							<g:each in="${SearchParams.list().unique()}" status="index"
								var="existingSearchParams">
								<option value="${existingSearchParams.id}">
									${existingSearchParams.name}
								</option>
							</g:each>

						</select>
					</div>

					<button type="submit" class="btn btn-default">Generate Graph</button>
				</g:form>

			</div>
		</div>

		<div class="col-lg-6">
			<div class="form-group">

				<g:form action="graphOnResults" id="formGraphOnResuls">

					<div class="form-group">
						<label>Existing results</label>
						<g:select class="form-control" optionKey="id"
							optionValue="${{it.searchParams.name + '('+it.results.first().profileName+') ' + it.resultDate + ' '}}"
							name="resultsnames" from="${GrepSearchResult.list().unique()}"
							multiple="true" />
					</div>

					<button type="submit" class="btn btn-default">Generate Graph based on existing result</button>
				</g:form>

			</div>
		</div>
	</div>



</body>
</html>