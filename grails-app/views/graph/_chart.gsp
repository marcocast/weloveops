<table>
<tr>
<td>
<gvisualization:pieCoreChart dynamicLoading="${true}"
	elementId="piechart" title="${'Occurences Per Profile Pie'}" width="${450}"
	height="${300}" columns="${myDailyActivitiesColumns}"
	data="${myDailyActivitiesData}" />
<div id="piechart"></div>
</td>
<td>
<gvisualization:columnCoreChart dynamicLoading="${true}"
	elementId="columnCoreChart" title="${'Profiles Activities'}" width="${450}"
	height="${300}" columns="${myDailyActivitiesColumns}"
	data="${myDailyActivitiesData}" />
<div id="columnCoreChart"></div>
</td>
<td>
<gvisualization:barCoreChart dynamicLoading="${true}"
	elementId="barCoreChart" title="${'Profiles bar line'}" width="${450}"
	height="${300}" columns="${myDailyActivitiesColumns}"
	data="${myDailyActivitiesData}" />
<div id="barCoreChart"></div>
</td>
</tr>
</table>

	
	

		
