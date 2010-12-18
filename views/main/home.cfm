<cfparam name="session.loggedIn" default="true" />
<cfparam name="session.accountId" default="1" />

<a href="/lunchtime/?reload=true">Reload FW/1</a><br/>
<a href="/lunchtime/?reload=true&ormReload=true">Reload FW/1 + ORM definitions</a><br/>
<a href="/lunchtime/?action=links.list">view my links</a><br/>


<cfdump var="#session#">

<!---
<cfdump var="#entityLoad('account')#" />
<cfdump var="#entityLoad('link')#" />
<cfdump var="#entityLoad('tag')#" />
--->