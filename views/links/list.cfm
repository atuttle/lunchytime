<cfset links = rc.data />
<cfoutput>
	<cfloop array="#links#" index="link">
		<div class="linksHeader">
			<span id="linkCount">You have #rc.linkCount# bookmarks</span>
		</div>
		<div class="displayLink">
			<span class="link">
				<a href="#link.getLinkUrl()#">#link.getLinkTitle()#</a> [#link.getBookmarkedCount()#]
			</span>
			<span class="description">
				#link.getLinkDescription()#
			</span>
			<div class="linkTags">
				<cfloop array="#link.getTags()#" index="tag">
					<span class="tag">
						<a href="#buildUrl(action='links.list',queryString='tag=#tag.getTagName()#')#">#tag.getTagName()#</a>
					</span>
				</cfloop>
			</div>
		</div>
		<cfdump var="#link#">
	</cfloop>
</cfoutput>