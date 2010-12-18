component persistent="true" {

	property name="tagId" fieldtype="id" generated="insert";
	property name="tagName";

	//M2M relationship with links
	property name="links" fieldtype="many-to-many" cfc="link" singularname="link" linktable="link_tag" fkcolumn="tagId" inversejoincolumn="linkId" lazy="true";


	/* customize accessors to set both sides of relationships */

	public tag function init() {
        if (isNull(variables.Countries)) {
            variables.Links = [];
        }
        return this;
    }

    public void function addLink(required link link)
        hint="set both sides of the bi-directional relationship" {
        if (not hasLink(arguments.link)) {
            // set this side
            arrayAppend(variables.links,arguments.link);
            // set the other side
            arrayAppend(arguments.link.getTags(),this);
        }
    }

    public void function removeLink(required link link)
        hint="set both sides of the bi-directional relationship" {
        if (hasLink(arguments.link)) {
            // set this side
            var index = arrayFind(variables.links,arguments.link);
            if (index gt 0) {
                arrayDeleteAt(variables.links,index);
            }
            // set the other side
            index = arrayFind(arguments.link.getTags(),this);
            if (index gt 0) {
                arrayDeleteAt(arguments.link.getTags(),index);
            }
        }
    }

}
