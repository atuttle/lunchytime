<beans>

	<!-- orm service layer -->
	<bean id="accountSvc" class="orm.accountService" singleton="true" />
	<bean id="linkSvc" class="orm.linkService" singleton="true" />
	<bean id="tagSvc" class="orm.tagService" singleton="true" />

</beans>