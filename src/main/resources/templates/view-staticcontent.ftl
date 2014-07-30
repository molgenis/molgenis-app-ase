<#include "molgenis-header.ftl">
<#include "molgenis-footer.ftl">
<#assign css=[]>
<#assign js=["direct.repository.query.js"]>

<@header css js />

<#if isCurrentUserCanEdit?has_content && isCurrentUserCanEdit>
	<div class="row-fluid">
	   <div class="control-group">
			<div class="controls">
				<div class="btn-group">
					<ul>
						<li>
							<form action="${context_url}/upload-logo" method="POST" enctype="multipart/form-data">
								<input type="file" name="logo" />
								<input type="submit" value="Upload logo" class="btn" />
							</form>
						</li>
						<li><a id="editBtn" href="${context_url}/edit" class="btn">Edit page</a></li>
					</ul>
				</div>
			</div>
		</div>	
	</div>
</#if>

<#if content?has_content>
	<div class="row-fluid">
		<div class="span12">
			${content}
		
			<hr></hr>	
		
			<div class="input-append span4" id="direct-repository-query-container">
				<input class="span4" id="direct-repository-query" type="text" placeholder="Search for ASEs">
				<button class="btn" type="button" id="direct-repository-query-button"><i class="icon-large icon-search"></i></button>
				<label>
				Query the ASE table directly via a Gene identifier (ENSG00000048707)<br/> 
				or a chromosome position combination (1:12570608)
				</label>
			</div>	
		</div>
	</div>
</#if>

<@footer/>
