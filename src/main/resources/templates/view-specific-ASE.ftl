<#assign counter = 0 />

<#-- Table here -->
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
				
				<th>${key}</th>
				<td>${entityMap[key]}</td>
				<#assign counter = counter + 1>
			</#list>
		</tr>
	</tbody>
</table>

<#-- Download button-->
<button id="csvDownloadButton" data-href="/menu/main/dataexplorer/details/csv">Download ASE sample table</button>

<hr></hr>

<#-- Image here -->
<div id="AseImage">
	<#assign link = entityMap["SNP_ID"]?replace(":", "_")>
	<img src="https://molgenis26.target.rug.nl/downloads/publicRnaSeq/asePlots/png/${link}.png"><img>
</div>

<hr></hr>

<#-- Genomebrowser here -->
<div id="modalGenomeBrowser"></div>


<script>
	molgenis.dataexplorer.data.createGenomeBrowser({
		pageName: 'modalGenomeBrowser', 
		noPersist: true, chr: ${entityMap["Chr"]}, 
		viewStart: parseInt(${entityMap["Pos"]}, 10) - 10000, 
		viewEnd: parseInt(${entityMap["Pos"]}, 10) + 10000
	}); 
</script>