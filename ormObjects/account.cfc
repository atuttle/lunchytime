component persistent="true" {

	property name="accountId" fieldtype="id" generated="insert";
	property name="accountName";
	property name="accountPassword";

	property name="Links" cfc="link" singularname="Link" fieldtype="one-to-many" fkcolumn="linkId" lazy="true";

}
