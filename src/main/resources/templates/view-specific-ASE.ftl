<#assign counter = 0 />
<table class="table table-condensed table-striped table-responsive">
	<tbody>
		<thead></thead>
		<tr>
			<#list entityMap?keys as key>
				<#if counter == 3>
					</tr>
					<tr>
					<#assign counter = 0>
				</#if>
				
				<#if key != "ID"><th>${key}</th></#if>
				<#if entityMap[key] != entityId><td>${entityMap[key]}</td></#if>
				<#assign counter = counter + 1>
			</#list>
		</tr>
	</tbody>
</table>

<button id="csvDownloadButton" data-href="/menu/main/dataexplorer/details/csv">Download ASE sample table</button>

<hr></hr>

<#-- Genomebrowser here -->
<div id="modalGenomeBrowser"></div>

<hr></hr>

<div id="AseImage">
	<#-- Image here, based on naming convention aseimage_<chromosome>_<position>.png-->
	<img src="http://4.bp.blogspot.com/-72J9scxxz0A/TyNo7iASgXI/AAAAAAAAA1c/bTVs_E14_pM/s1600/Science..jpg"><img>
</div>

<script>

var chrom  = ${entityMap["Chr"]};
var start = parseInt(${entityMap["Pos"]}, 10) - 10000;
var stop = parseInt(${entityMap["Pos"]}, 10) + 10000;

createGenomeBrowser({pageName: 'modalGenomeBrowser', noPersist: true, chr: chrom, viewStart: start, viewEnd: stop}) 
	
</script>