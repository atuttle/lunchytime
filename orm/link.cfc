component persistent="true" {

	property name="linkId" fieldtype="id" generated="insert";
	property name="linkUrl";
	property name="linkTitle";
	property name="linkDescription";

	//property name="accountId";
	property name="account" fieldtype="many-to-one" fkcolumn="accountId" cfc="account" missingrowignored="true";

	//M2M relationship with tags
	property name="tags" fieldtype="many-to-many" cfc="tag" singularname="tag" linktable="link_tag" fkcolumn="linkId" inversejoincolumn="tagId" lazy="true";


	/* customize accessors to set both sides of relationships */

	public link function init() {
        if (isNull(variables.tags)) {
            variables.tags = [];
        }
        return this;
    }

    public void function addTag(required tag tag)
        hint="set both sides of the bi-directional relationship" {
        arguments.tag.addLink(this);
    }

    public void function removeTag(required tag tag)
        hint="set both sides of the bi-directional relationship" {
        arguments.tag.removeLink(this);
    }

	public numeric function getBookmarkedCount() output="false" {
		return ormExecuteQuery ("select count(*) from link where linkUrl = :linkUrl", {linkUrl = getLinkUrl()}, true);
	}

}
