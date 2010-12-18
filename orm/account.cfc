component persistent="true" {

	property name="accountId" fieldtype="id" generated="insert";
	property name="accountName";
	property name="accountPassword";

	property name="Links" fieldtype="one-to-many" cfc="link" type="array" singularname="Link" fkcolumn="accountId" lazy="true" inverse="true";

	public function getLinks_paged(numeric startIndex, numeric numItems) output="false" {
		return entityLoad("link", {account=this},'linkId desc',{offset=startIndex,maxresults=numItems});
	}

}
