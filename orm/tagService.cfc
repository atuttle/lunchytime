component output="false" hint="CFBuilder-Generated:tag"
{
	remote tag function createTag(tag item)
	{
		/* Insert a new record in tag */
		transaction {
			entitysave(item);
		}
		return item;
	}

	remote void function deleteTag( tagId	)
	{
		/* Delete a record in the database */
		transaction {
			var primaryKeysMap = { tagId = tagId };
			var item=entityload("tag",primaryKeysMap,true);
			if(isnull(item) eq false)
				entitydelete(item);
		}
		return;
	}

	remote tag[] function getAllTags()
	{
		return entityload("tag");
	}

	remote tag[] function getTags_paged(numeric startIndex,numeric numItems)
	{
		return entityload("tag",{},"",{offset=startIndex,maxresults=numItems});
	}

	remote tag function getTag( tagId )
	{
		/* Retrieve a single record and return it */
		var primaryKeysMap = { tagId = tagId };
		return entityload("tag",primaryKeysMap,true);
	}

	remote tag function updateTag(tag item)
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
		return ormexecutequery("select count(*) from tag",true);
	}

}
