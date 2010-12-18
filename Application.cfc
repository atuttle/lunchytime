component extends="fw1.corfield.framework" {

	this.name = 'lunchtime';
	this.sessionmanagement = true;
	this.sessiontimeout = createTimespan(0,0,10,0);
	this.setclientcookies = true;
	this.scriptprotect = false;
	this.ormenabled = true;
	this.datasource="atuttle_lunchtime";
	this.ormsettings = {
		cfclocation = expandPath('./orm'),
		dialect = "MySQL"
	};
	this.mappings = { "/lunchtime" = getDirectoryFromPath(getCurrentTemplatePath()) };

	//FW1 settings
	variables.framework = {
		home = "main.home"
	};

	function setupApplication(){
		if (structKeyExists(url, "ormReload") and url.ormReload){
			//this method requires BOTH ?reload=true AND &ormReload=true in the URL
			//to reload orm! (otherwise setupApplication doesn't get called)
			ormReload();
		}
		//clear session info on app restart
		structDelete(session, "accountId");
	}

	function setupRequest(){
		url.profile = true; //for now, turn on orm profiling for every request
	}

	function onRequestEnd(){
		if (structKeyExists(url, "profile") and url.profile){
			ormFlush();
			include "ormProfile.cfm";
		}
	}

}
