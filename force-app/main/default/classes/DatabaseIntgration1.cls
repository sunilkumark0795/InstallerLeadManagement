public class DatabaseIntgration1 {
    public static void getInstallerData(){
        List<Installer__c> installers= [SELECT Id, Installer_Name__c, Email__c, Phone_Number__c, Address_Line_1__c, 
                                        Address_Line_2__c, City__c, State__c, Country__c
                                        FROM Installer__c];
        
    }
    
    public static void insertOps()
    {
        List<Installer__c> installers = new List<Installer__c>(); 
        Installer__c installer = new Installer__c();
        installer.Address_Line_1__c = 'Test Address 1';
        installer.Address_Line_2__c = 'Test Address 2';
        installer.City__c = 'Chennai';
        installer.State__c = 'TN';
        installer.Country__c = 'IN';
        installer.Installer_Name__c = 'Simon';
        installer.Email__c = 'Test3@gmail.com';
        installer.Phone_Number__c = '9845620352';
        installer.Postal_Code__c = '560050';
        
        installers.add(installer);
        
      
        installer = new Installer__c();
        
        installer.Address_Line_1__c = 'Test Address 3';
        installer.Address_Line_2__c = 'Test Address 4';
        installer.City__c = 'Bangalore';
        installer.State__c = 'KA';
        installer.Country__c = 'IN';
        installer.Installer_Name__c = 'Villiers';
        installer.Email__c = 'Test4@gmail.com';
        installer.Phone_Number__c = '9845656352';
        installer.Postal_Code__c = '560090';
        
        installers.add(installer);
        insert installers;
        
    }
}