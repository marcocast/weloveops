<!DOCTYPE html>
<html>
<head>
<g:javascript library="jquery" />
<title>result page</title>
<meta name="layout" content="main">
</head>
<body>

	<div class="nav" role="navigation">
		<table class="result">
			<g:each in="${searchParams.profiles}" status="i" var="profile">
				<script>
			  	<g:remoteFunction controller="search" action="executeSearch" update="resultBox${profile.name},total" 
				  	params="'name=${searchParams.name}&text=${searchParams.text}&regex=${searchParams.regex}&profileName=${profile.name}'+ '&searchParams=${searchParams}'"/>
        	  </script>
				<tr>
					<td><label for="result">Result for profile : ${profile.name}</label></td>
				</tr>
				<tr>
					<td id="resultBox${profile.name}"><img src="${createLinkTo(dir:'images',file:'ajax-loader.gif')}"
						alt="Loading..." width="200" height="30" /></td>
				</tr>
			</g:each>
		</table>
	</div>
</body>
</html>