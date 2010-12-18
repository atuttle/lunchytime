component output="false"
{

	/* service layer */
	public void function setLinkSvc(linkSvc){
		variables.linkSvc = arguments.linkSvc;
	}
	public void function setAccountSvc(accountSvc){
		variables.accountSvc = arguments.accountSvc;
	}


	/* app model */

	public array function list(accountId, startIndex = 0, numItems = 10) output="false" {
		return variables.accountSvc.getAccount(arguments.accountId).getLinks_paged(startIndex=arguments.startIndex,numItems=arguments.numItems);
	}

	public numeric function linkCount(accountId) output="false" {
		return variables.accountSvc.getAccount(arguments.accountId).getLinkCount();
	}

}
