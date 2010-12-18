component persistent="true" {

	property name="accountId" fieldtype="id" generated="insert" generator="identity";
	property name="accountName";

	property name="Links" fieldtype="one-to-many" cfc="link" type="array" singularname="Link" fkcolumn="accountId" lazy="true" inverse="true";

	public function getLinks_paged(numeric startIndex, numeric numItems) output="false" {
		return entityLoad("link", {account=this},'linkId desc',{offset=startIndex,maxresults=numItems});
	}

	public function getLinkCount() output="false" {
		return ormexecutequery("select count(*) from link where accountId = #getAccountId()#", true);
	}

}
