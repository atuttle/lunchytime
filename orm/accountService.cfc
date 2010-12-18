component output="false"
{
	remote account function createaccount(account item)
	{
		/* Insert a new record in account */
		transaction {
			entitysave(item);
		}
		return item;
	}

	remote void function deleteaccount( accountId	)
	{
		/* Delete a record in the database */
		transaction {
			var primaryKeysMap = { accountId = accountId };
			var item=entityload("account",primaryKeysMap,true);
			if(isnull(item) eq false)
				entitydelete(item);
		}
		return;
	}

	remote account[] function getAllaccounts()
	{
		return entityload("account");
	}

	remote account[] function getAccounts_paged(numeric startIndex,numeric numItems)
	{
		return entityload("account",{},"",{offset=startIndex,maxresults=numItems});
	}

	remote account function getAccount( accountId )
	{
		/* Retrieve a single record and return it */
		var primaryKeysMap = { accountId = accountId };
		return entityload("account",primaryKeysMap,true);
	}

	remote account function updateaccount(account item)
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
		return ormexecutequery("select count(*) from account",true);
	}
}
