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
	this.mappings = {};

	//FW1 settings
	variables.framework = {
		home = "main.home"
	};

	function setupApplication(){
		ormReload(); //on app reset, also reset orm config (reloads changes to persistent cfcs)
	}

}
