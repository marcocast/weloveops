<html>
<head>
<g:javascript library="jquery" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>


<title>result page</title>
<meta name="layout" content="main">

</head>
<body>
	<div class="nav" role="navigation">
	
			
	

			<script>
			  	<g:remoteFunction controller="graph" action="execute" update="thechart" 
				  	params="'name=${searchParams.name}'"/>
        	  </script>
					
		<br>
		<div id="thechart"></div>



	</div>
</body>
</html>