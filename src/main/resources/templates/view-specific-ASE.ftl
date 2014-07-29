<#assign counter = 0 />

<#-- Table here -->
<table class="table table-condensed table-striped table-responsive">
	<thead></thead>
	<tbody>
		<tr>
			<#list entityMap?keys as key>
				<#if key != "Genes">
					<#if counter == 3>
						</tr>
						
						<tr>
						<#assign counter = 0>
					</#if>
				
					<#if key == "SNP_ID" &&	entityMap[key]?starts_with("rs")>
						<th>${key}</th>
						<td>
							<a target="_blank" href="http://identifiers.org/dbsnp/${entityMap[key]}">${entityMap[key]}</a>
						</td>
					<#else>
						<th>${key}</th>
						<td>${entityMap[key]}</td>
					</#if>
					<#assign counter = counter + 1>
				</#if>	
			</#list>
		</tr>
	</tbody>
</table>

<table class="table table-condensed table-striped table-responsive">
	<thead>
		<#list  entity.getEntities("Genes")?first.getAttributeNames() as attribute>
			<th>${attribute}</th>
		</#list>
	</thead>
	<tbody>
		<#list entity.getEntities("Genes") as gene>
			<tr>
			<#list gene.getAttributeNames() as attribute>
				<#if attribute == "Ensembl_ID">
					
					<td>
						<a target="_blank" href="http://identifiers.org/ensembl/${gene.get(attribute)}">${gene.get(attribute)}</a>
					</td>
				<#else>
					<td>${gene.get(attribute)}</td>
				</#if>

			
				
			</#list>
			</tr>
		</#list>
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