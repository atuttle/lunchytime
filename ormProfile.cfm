<!--- Get the factory --->
<cfset f = ormGetSessionFactory()>
<cfset fStats = f.getStatistics()>
<cfset fStats.setStatisticsEnabled(javacast("boolean",true))>

<cfset totalStats = {
	inserts = fStats.getEntityInsertCount(),
	loads = fStats.getEntityLoadCount(),
	deletes = fStats.getEntityDeleteCount(),
	updates = fStats.getEntityUpdateCount(),
	hql = fStats.getQueries(),
	flushcount = fStats.getFlushCount(),
	sessions = fStats.getSessionOpenCount(),
	transactions = fStats.getTransactionCount(),
	entities = {}
}/>
<cfloop index="n" array="#fStats.getEntityNames()#">
	<cfset totalStats.entities[n] = {}>
	<cfset stats = fStats.getEntityStatistics(n)>
	<cfset totalStats.entities[n].deletes = stats.getDeleteCount()>
	<cfset totalStats.entities[n].inserts = stats.getInsertCount()>
	<cfset totalStats.entities[n].updates = stats.getUpdateCount()>
	<cfset totalStats.entities[n].loads = stats.getLoadCount()>
</cfloop>

<cfset request._ormStats = totalStats />
