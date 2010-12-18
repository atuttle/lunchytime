component output="false" {

	public void function init(fw) output="false" {
		variables.fw = arguments.fw;
	}


	//1st
	public void function before(struct rc) output="false" {
		//set the accountId for service to use, if necessary, in all methods
		if (structKeyExists(session, "accountId"))
			rc.accountId = session.accountId;
	}

	//2nd
	//public void function startHome(struct rc) output="false" {}

	//3rd
	public function home(struct rc) output="false" {
		param name="session.loggedIn" default="false";
		rc.attemptingLogin = false;
		if (!session.loggedIn){
			if (structKeyExists(cookie, "fbs_#application.fb.fbappId#")){
				local.fbGraph = createObject("lunchytime.libs.fbGraph").init(application.fb.fbappid,application.fb.fbsecret);
				local.profile = local.fbGraph.getProfile();
				if (isStruct(local.profile)){
					//facebook auth successful
					session.email = local.profile.email;
					session.fname = local.profile.first_name;
					session.lname = local.profile.last_name;
					session.fbProfile = local.profile;
					rc.email = local.profile.email;
					rc.attemptingLogin = true;
				}
			}
		}else{
			if (structKeyExists(rc, "logout") or !structKeyExists(cookie, "fbs_#application.fb.fbappId#")){
				//logout request
				structDelete(session, "email");
				structDelete(session, "fname");
				structDelete(session, "lname");
				structDelete(session, "accountId");
				structDelete(session, "fbProfile");
				session.loggedIn = false;
			}
		}
		return rc;
	}

	//4th, service is called

	//5th
	public void function endHome(struct rc) output="false" {
		if (rc.attemptingLogin){
			if (!isNull(rc.data)){
				session.accountId = rc.data.getAccountId();
			}else{
				//create a new account
				newAccount = new lunchytime.orm.account();
				newAccount.setAccountName(rc.email);
				newAccount = variables.fw.getBeanFactory().getBean("accountSvc").createAccount(newAccount);
				session.accountId = newAccount.getAccoundId();
			}
			session.loggedIn = true;
		}
	}

	//last
	//public void function after(struct rc) output="false" {}

}
