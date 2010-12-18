component output="false" {

	public void function setAccountSvc(accountSvc) output="false" {
		variables.accountSvc = accountSvc;
	}

	public function home(email,attemptingLogin) {
		if (arguments.attemptingLogin)
			return variables.accountSvc.getAccountByEmail(arguments.email);
	}

}
