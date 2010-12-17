component output="false" hint="CFBuilder-Generated:link_tag"
{

	
	/*
	LINK_TAG SERVICES

	*/
	/* Add link_tag */

	remote link_tag function createlink_tag(link_tag item)
	{
		/* Auto-generated method
		  Insert a new record in link_tag */
		entitysave(item);

		/* return created item */
		return item;
	}

	/* Remove link_tag */
	remote void function deletelink_tag( )
	{
		/* Auto-generated method
		         Delete a record in the database */
		var primaryKeysMap = { };
		var item=entityload("link_tag",primaryKeysMap,true);
		if(isnull(item) eq false)
			entitydelete(item);
		
		return;
	}

	/* Get All link_tag */
	remote link_tag[] function getAlllink_tag()
	{
		/* Auto-generated method
		        Retrieve set of records and return them as a query or array */
		/* return items */
		return entityload("link_tag");
	}

	/* Get All Paged link_tag */
	remote link_tag[] function getlink_tag_paged(numeric startIndex,numeric numItems)
	{
		/* Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow */
		/* return paged items */
		return entityload("link_tag",{},"",{offset=startIndex,maxresults=numItems});
	}

	/* Get link_tag */
	remote link_tag function getlink_tag( )
	{
		/* Auto-generated method
		         Retrieve a single record and return it */
		/* return item */
		var primaryKeysMap = { };
		return entityload("link_tag",primaryKeysMap,true);
	}

	/* Save link_tag */
	remote link_tag function updatelink_tag(link_tag item)
	{
		/* Auto-generated method
		         Update an existing record in the database */
		/* update link_tag */
		entitysave(item);
		return item;
	}

	/* Count link_tag */
	remote numeric function count()
	{
	/* Auto-generated method
		         Return the number of items in your table */
		return ormexecutequery("select count(*) from link_tag",true);
	}

} 
