<html>
<head>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<g:javascript library="jquery" />


<title>result page</title>
<meta name="layout" content="main">

</head>
<body>
	<div class="nav" role="navigation">

   
		<input type="button" value="Render Pie Chart"
			onclick="${remoteFunction(controller:'graph',action:'render',update:'chart')}">
		<br>
		<div id="chart"></div>







	</div>
</body>
</html>