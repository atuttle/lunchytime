component output="false" hint="CFBuilder-Generated:tag"
{

	
	/*
	TAG SERVICES

	*/
	/* Add tag */

	remote tag function createtag(tag item)
	{
		/* Auto-generated method
		  Insert a new record in tag */
		entitysave(item);

		/* return created item */
		return item;
	}

	/* Remove tag */
	remote void function deletetag( tagId	)
	{
		/* Auto-generated method
		         Delete a record in the database */
		var primaryKeysMap = { tagId = tagId };
		var item=entityload("tag",primaryKeysMap,true);
		if(isnull(item) eq false)
			entitydelete(item);
		
		return;
	}

	/* Get All tag */
	remote tag[] function getAlltag()
	{
		/* Auto-generated method
		        Retrieve set of records and return them as a query or array */
		/* return items */
		return entityload("tag");
	}

	/* Get All Paged tag */
	remote tag[] function gettag_paged(numeric startIndex,numeric numItems)
	{
		/* Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow */
		/* return paged items */
		return entityload("tag",{},"",{offset=startIndex,maxresults=numItems});
	}

	/* Get tag */
	remote tag function gettag( tagId )
	{
		/* Auto-generated method
		         Retrieve a single record and return it */
		/* return item */
		var primaryKeysMap = { tagId = tagId };
		return entityload("tag",primaryKeysMap,true);
	}

	/* Save tag */
	remote tag function updatetag(tag item)
	{
		/* Auto-generated method
		         Update an existing record in the database */
		/* update tag */
		entitysave(item);
		return item;
	}

	/* Count tag */
	remote numeric function count()
	{
	/* Auto-generated method
		         Return the number of items in your table */
		return ormexecutequery("select count(*) from tag",true);
	}

} 
