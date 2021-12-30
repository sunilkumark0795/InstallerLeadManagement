trigger LeadTrigger on Lead (before insert,before update,after update) {
    //System.debug('Lead trigger called');
    for(lead leadRecord : Trigger.new){ 
           if(Trigger.isBefore && String.isBlank(leadRecord.LeadSource)){
            leadRecord.LeadSource = 'Other';
           }
           if((leadRecord.Status  == 'Closed - Converted' || leadRecord.Status  == 'Closed - Not Converted' ) && Trigger.oldMap.get(leadRecord.Id).Status == 'Open - Not Contacted'){
               leadRecord.status.addError('You cannot directly close an open lead record');
           }
        if(String.isBlank(leadRecord.Industry) && Trigger.isInsert){
            leadRecord.addError('The Industry field cannot be a blank');
        }
        
    }
    System.debug('Lead Trigger1');
}