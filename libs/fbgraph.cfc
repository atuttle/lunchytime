<cfcomponent output="false">

	<cffunction name="init">
		<cfargument name="appID" required="true" type="string">
		<cfargument name="secret_key" required="true" type="string">

		<!--- init global variables --->
		<cfset variables.appID = arguments.appID />
		<cfset variables.secret_key = arguments.secret_key />

		<cfreturn this />
	</cffunction>


	<cffunction name="getUID" access="public" output="true" returntype="any" hint="gets a user ID">
		 <cfargument name="prefix" type="string" required="false" default="uid=">

	     <cfset var uid = get_facebook_cookie(variables.appID,arguments.prefix,4,0) />

	     <cfreturn uid />
	</cffunction>

	<cffunction name="getAccessToken" access="public" output="true" returntype="any" hint="gets a user ID">
		 <cfargument name="prefix" type="string" required="false" default="access_token=">

  	     <cfset var access_token = get_facebook_cookie(variables.appID,arguments.prefix,14,0) />
	     <cfreturn access_token />
	</cffunction>

  <!--- Function that extracts User ID and access token from FB cookie. Both access_token and user id are needed to extract information related to the user from FaceBook Graph API --->
    <cffunction name="get_facebook_cookie" access="public" output="true" returntype="any">
        <cfargument name="app_id" type="string" required="true">
        <cfargument name="charToFind" type="string" required="true">
        <cfargument name="charToRemoveFront" type="string" required="true">
        <cfargument name="charToRemoveEnd" type="string" required="true">

        <cfset var args=arrayNew(1)>
		<cfset var i = "">
		<cfset var rvalue = "">
		<cfset var x = "">

        <cftry>
        <cfset x = StructFind(cookie, trim('fbs_' & arguments.app_id))>

        <cfset args=listtoarray(x,'&')>

        <cfloop from="1" to="#arrayLen(args)#" index="i">
            <cfif FindNoCase(arguments.charToFind, args[i])>
                <cfset rvalue= right(args[i],(len(""&args[i])-charToRemoveFront)) />

                <cfset rvalue= left(rvalue,(len(""&rvalue)-charToRemoveEnd)) />

                <cfreturn rvalue />
            </cfif>
        </cfloop>
        <cfcatch type="any">
        <cfreturn 0 />
        </cfcatch>
        </cftry>
    </cffunction>


	<cffunction name="getProfile" access="public" output="true" returntype="any" hint="gets a user's profile">
		<cfset var profile = "" />

	    <!--- Get FB User Profile. Profile Information allowed by the user are stored in a struct after deserialized from JSON --->
	    <cfhttp method="get" url="https://graph.facebook.com/me?access_token=#getAccessToken()#" result="profile" />

	    <cfif IsJSON(profile.filecontent)>
	        <cfreturn DeserializeJSON(profile.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>

	</cffunction>

	<cffunction name="getFriends" access="public" output="true" returntype="any" hint="gets all of a user's friends">

		<cfset var friends = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/friends?access_token=#getAccessToken()#" result="friends" />

	    <cfif IsJSON(friends.filecontent)>
	        <cfreturn DeserializeJSON(friends.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>


	<cffunction name="getNewsFeed" access="public" output="true" returntype="any" hint="">

		<cfset var newsFeed = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/home?access_token=#getAccessToken()#" result="newsFeed" />

	    <cfif IsJSON(newsFeed.filecontent)>
	        <cfreturn DeserializeJSON(newsFeed.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>

	<cffunction name="getWall" access="public" output="true" returntype="any" hint="">

		<cfset var feed = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/feed?access_token=#getAccessToken()#" result="feed" />

	    <cfif IsJSON(feed.filecontent)>
	        <cfreturn DeserializeJSON(feed.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>

	<cffunction name="getLikes" access="public" output="true" returntype="any" hint="">

		<cfset var likes = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/likes?access_token=#getAccessToken()#" result="likes" />

	    <cfif IsJSON(likes.filecontent)>
	        <cfreturn DeserializeJSON(likes.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>


	<cffunction name="getMovies" access="public" output="true" returntype="any" hint="">

		<cfset var movies = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/movies?access_token=#getAccessToken()#" result="movies" />

	    <cfif IsJSON(movies.filecontent)>
	        <cfreturn DeserializeJSON(movies.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>



	<cffunction name="getBooks" access="public" output="true" returntype="any" hint="">

		<cfset var books = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/books?access_token=#getAccessToken()#" result="books" />

	    <cfif IsJSON(books.filecontent)>
	        <cfreturn DeserializeJSON(books.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>


	<cffunction name="getNotes" access="public" output="true" returntype="any" hint="">

		<cfset var notes = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/notes?access_token=#getAccessToken()#" result="notes" />

	    <cfif IsJSON(notes.filecontent)>
	        <cfreturn DeserializeJSON(notes.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>



	<cffunction name="getPhotoTags" access="public" output="true" returntype="any" hint="">

		<cfset var phototags = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/photos?access_token=#getAccessToken()#" result="phototags" />

	    <cfif IsJSON(phototags.filecontent)>
	        <cfreturn DeserializeJSON(phototags.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>

	<cffunction name="getPhotoAlbums" access="public" output="true" returntype="any" hint="">

		<cfset var albums = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/albums?access_token=#getAccessToken()#" result="albums" />

	    <cfif IsJSON(albums.filecontent)>
	        <cfreturn DeserializeJSON(albums.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>


	<cffunction name="getVideos" access="public" output="true" returntype="any" hint="">

		<cfset var videos = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/videos?access_token=#getAccessToken()#" result="videos" />

	    <cfif IsJSON(videos.filecontent)>
	        <cfreturn DeserializeJSON(videos.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>

	<cffunction name="getEvents" access="public" output="true" returntype="any" hint="">

		<cfset var events = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/events?access_token=#getAccessToken()#" result="events" />

	    <cfif IsJSON(events.filecontent)>
	        <cfreturn DeserializeJSON(events.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>

	<cffunction name="getGroups" access="public" output="true" returntype="any" hint="">

		<cfset var groups = "" />

	    <!--- Get FB User Friends. Friends Information allowed by the user are stored in a struct after deserialized from JSON--->
	    <cfhttp method="get" url="https://graph.facebook.com/#getUID()#/groups?access_token=#getAccessToken()#" result="groups" />

	    <cfif IsJSON(groups.filecontent)>
	        <cfreturn DeserializeJSON(groups.filecontent) />
		<cfelse>
			<cfreturn 0/>
	    </cfif>
	</cffunction>

	<cffunction name="publishToWall" access="public" output="true" returntype="any" hint="Post something to a user's wall">
		<cfargument name="uid" required="true" type="string">
		<cfargument name="access_token" required="true" type="string">
		<cfargument name="message" required="true" type="string">
		<cfargument name="picture" required="true" type="string">
		<cfargument name="link" required="true" type="string">
		<cfargument name="name" required="true" type="string">
		<cfargument name="caption" required="true" type="string">
		<cfargument name="description" required="true" type="string">

	<cfhttp url="https://graph.facebook.com/#uid#/feed" result="publish" method="post">
		<cfhttpparam name="access_token" value="#access_token#" encoded="no" type="url">
		<cfhttpparam name="message" value="#message#" encoded="no" type="url">
		<cfhttpparam name="picture" value="#picture#" encoded="no" type="url">
		<cfhttpparam name="link" value="#link#" encoded="no" type="url">
		<cfhttpparam name="name" value="#name#" encoded="no" type="url">
		<cfhttpparam name="caption" value="#caption#" encoded="no" type="url">
		<cfhttpparam name="description" value="#description#" encoded="no" type="url">
	</cfhttp>
	</cffunction>

</cfcomponent>