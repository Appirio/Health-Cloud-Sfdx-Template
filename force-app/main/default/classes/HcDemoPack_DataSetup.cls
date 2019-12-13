//─────────────────────────────────────────────────────────────────────────────────────────────────┐
/**
 * @class       HcDemoPack_DataSetup
 * @description Implements a collection of static methods that can be used to create demo data.
 * @version     1.0.0
 * @public
 */
//─────────────────────────────────────────────────────────────────────────────────────────────────┘
public class HcDemoPack_DataSetup {

    //deactivate service agent
    //public static void deactiveAgent() {
     // User serviceAgent = [SELECT Id, IsActive FROM User WHERE Name ='Service Agent'];
      //serviceAgent.isActive = False;
      //update serviceAgent;
    //}

//create users 
    public static void createMel() {
      //query for profile
      Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Health Cloud Care Coordinator' LIMIT 1];
      
      //generate random username
      Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));

      User usr = new User();
      usr.LastName = 'Smith';
      usr.FirstName='Melinda';
      usr.Alias='melsmith';
      usr.Email = 'msmith@example.com';
      usr.Username='melindasvi0xy' + randomInt + '@myscratch.com.org';
      usr.ProfileId = profileId.id;
      usr.TimeZoneSidKey = 'GMT';
      usr.LanguageLocaleKey = 'en_US';
      usr.LocaleSidKey = 'en_US';
      usr.EmailEncodingKey = 'UTF-8';

      insert usr; 

      //permsets: ["HealthCloudPermissionSetLicense", "HealthCloudAdmin"]

   
    }
    public static void createJohn() {
      //query for profile -- need his actual profile..
      Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Health Cloud Care Coordinator' LIMIT 1];
      
      //generate random username
      Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));

      User usr = new User();
      usr.LastName = 'Bosworth';
      usr.FirstName='John';
      usr.Alias='jbos';
      usr.Email = 'jbosworth@example.com';
      usr.Username='jbosworth' + randomInt + '@myscratch.com.org';
      usr.ProfileId = profileId.id;
      usr.TimeZoneSidKey = 'GMT';
      usr.LanguageLocaleKey = 'en_US';
      usr.LocaleSidKey = 'en_US';
      usr.EmailEncodingKey = 'UTF-8';

      insert usr; 

      //permsets: ["HealthCloudPermissionSetLicense", "HealthCloudAdmin"]
   
    }

    public static void createSally() {
      //query for profile -- need his actual profile..
      Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Patient Engagement (Provider)' LIMIT 1];
      
      //generate random username
      Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));

      User usr = new User();
      usr.LastName = 'Agent';
      usr.FirstName='Sally';
      usr.Alias='sagent';
      usr.Email = 'sagent@example.com';
      usr.Username='sagent' + randomInt + '@myscratch.com.org';
      usr.ProfileId = profileId.id;
      usr.TimeZoneSidKey = 'GMT';
      usr.LanguageLocaleKey = 'en_US';
      usr.LocaleSidKey = 'en_US';
      usr.EmailEncodingKey = 'UTF-8';

      insert usr; 

      //permsets: ["HealthCloudPermissionSetLicense", "HealthCloudAdmin"]

   
    }

    public static void createPeter() {
      //query for profile -- need his actual profile..
      Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Physician Referral Management (Provider)' LIMIT 1];
      
      //generate random username
      Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));

      User usr = new User();
      usr.LastName = 'Porter';
      usr.FirstName='Peter';
      usr.Alias='ppet';
      usr.Email = 'pporter@example.com';
      usr.Username='pporter' + randomInt + '@myscratch.com.org';
      usr.ProfileId = profileId.id;
      usr.TimeZoneSidKey = 'GMT';
      usr.LanguageLocaleKey = 'en_US';
      usr.LocaleSidKey = 'en_US';
      usr.EmailEncodingKey = 'UTF-8';

      insert usr; 

      //permsets: ["HealthCloudPermissionSetLicense", "HealthCloudAdmin"]
   
    }

    

    public static void enablePersonAccountRecordType(){
        //Enable Person Account in https://developer.salesforce.com/docs/atlas.en-us.health_cloud.meta/health_cloud/admin_enable_person_account.htm
        //Insert record in Custom Setting
        try{
            //Map<String_dataset_name, CustomSettingName__c> mcs = CustomSettingName__c.getAll();

            //CustomSettingName__c usPA = SELECT Name, Enable from CustomSettingName__c WHERE Name-'Use Person Account';


            HealthCloudGA__UsePersonAccount__c upa = [SELECT Id, Name FROM HealthCloudGA__UsePersonAccount__c WHERE Name ='Use Person Account'];
            upa.HealthCloudGA__Enable__c = true;
            update upa;
        }catch(System.DmlException e){
            System.debug (e.getMessage());
        }
        
    }


  
}