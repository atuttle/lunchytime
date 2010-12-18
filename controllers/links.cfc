component {

	public void function init(fw) output="false" {
		variables.fw = arguments.fw;
	}
	function setLinkService(linkService){
		variables.linkService = arguments.linkService;
	}


	//1st
	public void function before(struct rc) output="false" {
		//section-level security: require logged in
		if (not structKeyExists(session, "accountId")){
			variables.fw.redirect(action='main.home');
		}
	}

	//2nd
	//public void function startHome(struct rc) output="false" {}

	//3rd
	public struct function list(struct rc) output="false" {
		rc.accountId = session.accountId;
		return rc;
	}

	//4th, service is called

	//5th
	//public void function endHome(struct rc) output="false" {}

	//last
	//public void function after(struct rc) output="false" {}

}
