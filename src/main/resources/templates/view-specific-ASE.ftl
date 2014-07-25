<hr></hr>
<button id="csvDownloadButton" data-href="/menu/main/dataexplorer/details/csv">Download ASE sample table</button>
<hr></hr>

<#-- Genomebrowser here -->
<div id="modalGenomeBrowser"></div>

<div id="AseImage">
	<#-- Image here, based on naming convention aseimage_<chromosome>_<position>.png-->
	<img src="http://static.ddmcdn.com/gif/dog-groups-sporting-group0.jpg"><img>
</div>

<script>

var chrom  = ${entityMap["Chr"]};
var start = parseInt(${entityMap["Pos"]}, 10) - 10000;
var stop = parseInt(${entityMap["Pos"]}, 10) + 10000;

createGenomeBrowser({pageName: 'modalGenomeBrowser', noPersist: true, chr: chrom, viewStart: start, viewEnd: stop}) 
	
</script>