//Enable Person Account in https://developer.salesforce.com/docs/atlas.en-us.health_cloud.meta/health_cloud/admin_enable_person_account.htm
//Insert record in Custom Setting
HealthCloudGA__UsePersonAccount__c upa = [SELECT Id, Name FROM HealthCloudGA__UsePersonAccount__c WHERE Name ='Use Person Account'];
upa.HealthCloudGA__Enable__c = true;
update upa;