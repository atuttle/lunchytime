component output="false" hint="CFBuilder-Generated:account"
{

	
	/*
	ACCOUNT SERVICES

	*/
	/* Add account */

	remote account function createaccount(account item)
	{
		/* Auto-generated method
		  Insert a new record in account */
		entitysave(item);

		/* return created item */
		return item;
	}

	/* Remove account */
	remote void function deleteaccount( accountId	)
	{
		/* Auto-generated method
		         Delete a record in the database */
		var primaryKeysMap = { accountId = accountId };
		var item=entityload("account",primaryKeysMap,true);
		if(isnull(item) eq false)
			entitydelete(item);
		
		return;
	}

	/* Get All account */
	remote account[] function getAllaccount()
	{
		/* Auto-generated method
		        Retrieve set of records and return them as a query or array */
		/* return items */
		return entityload("account");
	}

	/* Get All Paged account */
	remote account[] function getaccount_paged(numeric startIndex,numeric numItems)
	{
		/* Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow */
		/* return paged items */
		return entityload("account",{},"",{offset=startIndex,maxresults=numItems});
	}

	/* Get account */
	remote account function getaccount( accountId )
	{
		/* Auto-generated method
		         Retrieve a single record and return it */
		/* return item */
		var primaryKeysMap = { accountId = accountId };
		return entityload("account",primaryKeysMap,true);
	}

	/* Save account */
	remote account function updateaccount(account item)
	{
		/* Auto-generated method
		         Update an existing record in the database */
		/* update account */
		entitysave(item);
		return item;
	}

	/* Count account */
	remote numeric function count()
	{
	/* Auto-generated method
		         Return the number of items in your table */
		return ormexecutequery("select count(*) from account",true);
	}

} 
