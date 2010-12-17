component output="false" hint="CFBuilder-Generated:link"
{

	
	/*
	LINK SERVICES

	*/
	/* Add link */

	remote link function createlink(link item)
	{
		/* Auto-generated method
		  Insert a new record in link */
		entitysave(item);

		/* return created item */
		return item;
	}

	/* Remove link */
	remote void function deletelink( linkId	)
	{
		/* Auto-generated method
		         Delete a record in the database */
		var primaryKeysMap = { linkId = linkId };
		var item=entityload("link",primaryKeysMap,true);
		if(isnull(item) eq false)
			entitydelete(item);
		
		return;
	}

	/* Get All link */
	remote link[] function getAlllink()
	{
		/* Auto-generated method
		        Retrieve set of records and return them as a query or array */
		/* return items */
		return entityload("link");
	}

	/* Get All Paged link */
	remote link[] function getlink_paged(numeric startIndex,numeric numItems)
	{
		/* Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow */
		/* return paged items */
		return entityload("link",{},"",{offset=startIndex,maxresults=numItems});
	}

	/* Get link */
	remote link function getlink( linkId )
	{
		/* Auto-generated method
		         Retrieve a single record and return it */
		/* return item */
		var primaryKeysMap = { linkId = linkId };
		return entityload("link",primaryKeysMap,true);
	}

	/* Save link */
	remote link function updatelink(link item)
	{
		/* Auto-generated method
		         Update an existing record in the database */
		/* update link */
		entitysave(item);
		return item;
	}

	/* Count link */
	remote numeric function count()
	{
	/* Auto-generated method
		         Return the number of items in your table */
		return ormexecutequery("select count(*) from link",true);
	}

} 
