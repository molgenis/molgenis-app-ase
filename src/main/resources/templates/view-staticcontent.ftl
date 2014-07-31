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
			</div>	
		</div>
	</div>
	<script>
		(function(i, s, o, g, r, a, m) {
    		i['GoogleAnalyticsObject'] = r;
    		i[r] = i[r] || function() {
        		(i[r].q = i[r].q || []).push(arguments)
    		}, i[r].l = 1 * new Date();
   
			a = s.createElement(o),
        	m = s.getElementsByTagName(o)[0];
    		a.async = 1;
    		a.src = g;
    		m.parentNode.insertBefore(a, m)
		})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-2273328-10', 'auto');
		ga('send', 'pageview');
	
		$("#direct-repository-query-container").keyup(function(event){
		    if(event.keyCode == 13){
				$("#direct-repository-query-button").click();
		    }
		});
	</script>
	
</#if>

<@footer/>
