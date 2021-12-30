trigger QuotationTrigger on Quotation__c (before insert, after insert, before update, after update) {
    
    List<Quotation__c> newQuotations = Trigger.New;
    
    QuotationTriggerHandler objHandler = new QuotationTriggerHandler();
    if(Trigger.isBefore && Trigger.isInsert)
    {
        objHandler.checkForExistingOpenQuotations(newQuotations);
        objHandler.updateQuotationNumber(newQuotations);
    }
    /*
    if(Trigger.isAfter && Trigger.isInsert)
    {
        objHandler.createGeneralItem(newQuotations);
    }    
*/
      
}