<cfoutput>
	<a href="#buildUrl(action='main.home',queryString='reload=true')#">Reload FW/1</a><br/>
	<a href="#buildUrl(action='main.home',queryString='reload=true&ormReload=true')#">Reload FW/1 + ORM definitions</a><br/>
	<a href="#buildUrl(action='links.list')#">view my links</a><br/>
</cfoutput>

<br/><br/>
<fb:login-button perms="email" autologoutlink="true"></fb:login-button>

<br/><br/>
<cfdump var="#session#" label="session"/>
<cfdump var="#cookie#" label="cookie">

<!--- Facebook OAuth 2.0 code --->
<div id="fb-root"></div>
<script src="http://connect.facebook.net/en_US/all.js"></script>
<cfoutput>
<script>
  FB.init({appId: '#application.fb.fbappid#', status: true, cookie: true, xfbml: true});
  FB.Event.subscribe('auth.sessionChange', function(response) {
	window.location.reload();//always reload so that cookie changes affect session
  });
</script>
</cfoutput> 