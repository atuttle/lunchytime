component output="false"
{
	remote link function createLink(link item)
	{
		/* Insert a new record in link */
		transaction {
			entitysave(item);
		}
		return item;
	}

	remote void function deleteLink( linkId	)
	{
		/* Delete a record in the database */
		transaction {
			var primaryKeysMap = { linkId = linkId };
			var item=entityload("link",primaryKeysMap,true);
			if(isnull(item) eq false)
				entitydelete(item);
		}
		return;
	}

	remote link[] function getAllLinks()
	{
		return entityload("link");
	}

	remote link[] function getLinks_paged(numeric startIndex,numeric numItems)
	{
		return entityload("link",{},"",{offset=startIndex,maxresults=numItems});
	}

	remote link function getLink( linkId )
	{
		/* Retrieve a single record and return it */
		var primaryKeysMap = { linkId = linkId };
		return entityload("link",primaryKeysMap,true);
	}

	remote link function updateLink(link item)
	{
		/* Update an existing record in the database */
		transaction {
			entitysave(item);
		}
		return item;
	}

	remote numeric function count()
	{
		/* Return the number of items in your table */
		return ormexecutequery("select count(*) from link",true);
	}
}
