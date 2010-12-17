component persistent="true" {

	property name="linkId" fieldtype="id" generated="insert";
	property name="linkUrl";
	property name="linkTitle";
	property name="linkDescription";

	//property name="accountId";
	property name="account" fieldtype="many-to-one" fkcolumn="accountId" cfc="account" missingrowignored="true";

}
