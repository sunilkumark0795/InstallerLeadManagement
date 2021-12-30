public class DBIntegration1 {

    public static List<Installer__c> getInstallerDataByName(String installerName)
    {
        
        String likevar = '%' + installerName + '%' ;
        List<Installer__c> installers=[select Id,installer_name__c,Email__c,Phone_Number__c,
                                       City__c,State__c,Country__c,Full_Address__c
                                       From Installer__c
                                       where installer_name__c LIKE :likevar
                                       Order By installer_name__c DESC];
        return installers;
      
    }
    
    public static void insertops()
    {
        try {
            
            Installer__c installer =  new Installer__c();
            List<Installer__c> installers = new List<Installer__c>();
            
            installer.Address_Line_1__c = '6th Crosss';
            installer.Address_Line_2__c = '5th Main Bangalore';
            installer.City__c = 'Bangalore';
            installer.Country__c = 'IN';
            installer.Email__c = 'Mayura123@gmail.com';
            installer.State__c = 'KA';
            installer.Installer_Name__c = 'Mayura';
            installer.GST_Number__c = 'M12345678';
            
            installers.add(installer);
           
            installer =  new Installer__c();
            installer.Address_Line_1__c = '7th Crosss';
            installer.Address_Line_2__c = '5th Main Madhurai';
            installer.City__c = 'Madhurai';
            installer.Country__c = 'IN';
            installer.Email__c = 'James312@gmail.com';
            installer.State__c = 'TN';
            installer.Installer_Name__c = 'James';
            installer.GST_Number__c = 'J12345678';
            
            installers.add(installer);
            
            insert installers;
            System.debug(installers);
            
        }
    
        Catch(Exception e)
        {
            System.Debug('Error occured while inserting records into installer');
            System.debug(e.getMessage());
        }
    }     
        
    
    public static void updateOps() {
        
        try {
            
            List<Installer__c> installers = getInstallerDataByName('Jam');
            Installer__c installer = new Installer__c();
            List<Installer__c> editInstallers = new List<Installer__c>();
            for(Installer__c inst : installers)
            {
                installer.Id = inst.Id;
                installer.Phone_Number__c = '9916140635';
                installer.Postal_Code__c = '560040';
                editInstallers.add(installer);
            }
            update editInstallers;
        }
            catch(exception e)
            {
                system.debug('Error occured while updating records in installer, Below is the error');
                System.debug(e.getMessage());
            }
           
    }
   
}