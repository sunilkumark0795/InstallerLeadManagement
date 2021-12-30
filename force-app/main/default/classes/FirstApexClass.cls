public class FirstApexClass {
    
    Public String fname;
    Public String lname;
    integer age;
    date dob;
    
    public void assignValues()
    {
        System.debug('Start of assignValues');
        Date todayDate = Date.today();
        // fname = 'Anil';
        // lname = 'kumar';
        dob = Date.newInstance(1995, 01, 07);
        //age = todayDate.addYears(-dob.year());
        age = todayDate.year()-dob.year();
        
        system.debug('fname-'+fname);
        system.debug('Last name-'+lname);
        system.debug('DOB-'+dob);
        system.debug('Age-'+age);
    }
    
  public void assignValuesUsingParameters(String fname, String lastName)
    {
        System.debug('Start of assignValuesUsingParameters');
        Date todayDate = Date.today();
        this.fname = fname;
        lname = lastName;
        dob = Date.newInstance(1995, 01, 07);
        //age = todayDate.addYears(-dob.year());
        age = todayDate.year()-dob.year();
        
        system.debug('fname-'+fname);
        system.debug('Last name-'+lname);
        system.debug('DOB-'+dob);
        system.debug('Age-'+age);
    }   
}