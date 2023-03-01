/************************************************************************************************************************************
    Author         : Oleg Krasko
    Description    : This trigger is a placeholder for different triggers on the Traditional All Access Pricing object.
    ----------------------------------------------------------------------------------------------------------------------------------
    VERSION        DATE            AUTHOR             DETAIL
    1              15 Feb, 2022    Oleg Krasko        Initial Deployment
**************************************************************************************************************************************/
trigger Traditional_All_Access_PricingTriggers on Traditional_All_Access_Pricing__c (before insert) {
    new MetadataDrivenTriggerHandler().run();
}