<html>
<head>
<g:javascript library="jquery" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>


<title>result page</title>
<meta name="layout" content="main">

</head>
<body>
	<div class="nav" role="navigation">


  <a href="/weloveops/graph/execute" onclick="jQuery.ajax({type:'POST', url:'/weloveops/graph/execute',success:function(data,textStatus){document.getElementById('thechart').innerHTML=data;alert(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});return false;">test</a>
	
       <g:remoteLink action="execute"  update="thechart">prod</g:remoteLink>
				
		
			
		<br>
		<div id="thechart"></div>
<script type="text/javascript">
    google.load('visualization', '1', {'packages': ['corechart'], 'callback': drawVisualization});
    
    
    function drawVisualization() {
        visualization_data = new google.visualization.DataTable();
        
        visualization_data.addColumn('string', 'Task');
        
        visualization_data.addColumn('number', 'Hours per Day');
        
        
        visualization_data.addRow([&#39;Work&#39;, 11]);
        
        visualization_data.addRow([&#39;Eat&#39;, 2]);
        
        visualization_data.addRow([&#39;Commute&#39;, 2]);
        
        visualization_data.addRow([&#39;Watch TV&#39;, 2]);
        
        visualization_data.addRow([&#39;Sleep&#39;, 7]);
        
      
        visualization = new google.visualization.PieChart(document.getElementById('piechart'));

        



        
        
        visualization.draw(visualization_data, {title: &#39;My Daily Activities&#39;, width: 450, height: 300});

        
    }
</script>

<div id="piechart"></div>






	</div>
</body>
</html>