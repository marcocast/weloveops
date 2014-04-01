<html>
<head>
<g:javascript library="jquery" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>


<title>result page</title>
<meta name="layout" content="main" />
<r:require modules="bootstrap" />

</head>
<body>
	<div class="nav" role="navigation">

		<script>
			  	<g:remoteFunction controller="graph" action="executeOnResults" update="thechart" 
				  	params="'selectedresultsnames=${resultsnames}'"/>
        	  </script>

		<br>
		<div id="thechart">
			<img src="${createLinkTo(dir:'images',file:'ajax-loader.gif')}"
				alt="Loading..." width="200" height="30" />
		</div>



	</div>
</body>
</html>