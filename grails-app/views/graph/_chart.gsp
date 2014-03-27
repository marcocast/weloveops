<table>
	<tr>
		<td><gvisualization:pieCoreChart dynamicLoading="${true}"
				elementId="piechart" title="${'Occurences Per Profile Pie'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="piechart"></div></td>
	</tr>
	<tr>
		<td><gvisualization:columnCoreChart dynamicLoading="${true}"
				elementId="columnCoreChart" title="${'Profiles Activities'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="columnCoreChart"></div></td>
	</tr>
	<tr>
		<td><gvisualization:barCoreChart dynamicLoading="${true}"
				elementId="barCoreChart" title="${'Profiles bar line'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="barCoreChart"></div></td>
	</tr>
</table>





