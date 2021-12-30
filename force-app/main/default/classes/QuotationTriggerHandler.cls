public class QuotationTriggerHandler {
   Public Void checkForExistingOpenQuotations(List<Quotation__c> newQuotations)
   {
   		Set<Id> installerIds = new Set<Id>();
   		Set<Id> CustomerIds = new Set<Id>();
    	for(Quotation__c newQ : newQuotations)
    	{
        	if(newQ.Status__c == 'Open')
        	{
             	installerIds.add(newQ.Installer_Number__c);
             	customerIds.add(newQ.Customer_Number__c);
        	}
    	}
    
    	List<Quotation__c> existingOpenQuotations = [Select ID,Status__c, Installer_Number__c, Customer_Number__c
                                                 	From Quotation__c
                                                 	Where Status__c= 'Open' And Installer_Number__c In :installerIds
                                                 	And Customer_Number__c In :customerIds ];
    
    	Set<String> instCustStatusSet = new Set<String>();
    	for(Quotation__c existingQ : existingOpenQuotations)
    	{
        	String instCustStatusVal = existingQ.Installer_Number__c + ',' + existingQ.Customer_Number__c + ',' + existingQ.Status__c;
        	instCustStatusSet.add(instCustStatusVal);
    	}
    
    	for(Quotation__c newQ : newQuotations)
    	{
        	if(newQ.Status__c == 'Open')
        	{
            	String instCustStatusVal = newQ.Installer_Number__c + ',' + newQ.Customer_Number__c + ',' + newQ.Status__c;
            	if(instCustStatusSet.contains(instCustStatusVal))
            	{
                	newq.addError('Please check the existing quotation.If any exisitng quotations are in open status under the same installer and customer name');
            	}
            
        	}
    	}
   }
   
    public void updateQuotationNumber(List<Quotation__c> newQuotations)
    {
        Integer lastSiNo = 0;
        List<Quotation__c> lastQuotation = [Select Id, Name, CreatedDate From Quotation__c Order By CreatedDate Desc Limit 1 ];
        if(lastQuotation.size() > 0)
        {
        	for(Quotation__c lQ : lastQuotation )
        	{
            	String quotationNumber = lQ.Name;
            	List<String> quotationNumbers = quotationNumber.split('/');
                if(quotationNumbers.size() > 1)
                {
            		lastSiNo = Integer.valueOf( quotationNumbers.get(1) );
                }
        	}
        }
              
        
     	Set<Id> installerIds = new Set<Id>();
     	Map<Id, String> installerWith2Digit = new Map<Id,String>();  
     	for(Quotation__c newQ : newQuotations)
     	{
             installerIds.add(newQ.Installer_Number__c);

     	}
        
        List<Installer__c> installers = [Select ID, Installer_2_Digit_ID__c From Installer__c Where Id IN :installerIds];
        for(Installer__c inst : installers)
        {
            installerWith2Digit.put(inst.Id,inst.Installer_2_Digit_ID__c);
        }
        
        for(Quotation__c newQ : newQuotations)
        {
            String newQuotationNumber = '';
            String inst2DigitId = installerWith2Digit.get(newQ.Installer_Number__c);
            String quoteDateYear = String.valueOf( newQ.Quote_Date__c.year() );
            
            newQuotationNumber = inst2DigitId + '/' + (lastSiNo+1) + '/' + quoteDateYear;
            newQ.Quotation_No__c = newQuotationNumber;       
        }
    }
    
    
    /*
    public void createGeneralItem(List<Quotation__c> newQuotations)
    {
        General_Input__c gi = new General_Input__c();
        List<General_Input__c> giList = new List<General_Input__c>();
        Set<Id> quotationID = new Set<Id>();
 
        for(Quotation__c newQ : newQuotations)
        {
            gi = new General_Input__c();
            gi.Quotation_Number__c = newQ.Quotation_No__c;
            gi.Name = 'Room 1';
            giList.add(gi);        
        }
    }
    
    
    */
    
    
    
}