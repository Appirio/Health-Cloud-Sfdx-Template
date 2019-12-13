/**
 *  Accounts
 */
Account [] accountsToUpdate = new Account [] {};
Id A_HOUSEHOLD = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('IndustriesHousehold').getRecordTypeId();
Id A_INDIVIDUAL = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('IndustriesIndividual').getRecordTypeId();
for(Account a: [SELECT Id, HealthCloudGA__IndividualType__c FROM Account]) {
  switch on a.HealthCloudGA__IndividualType__c {
    when 'Group' {
      a.RecordTypeId = A_HOUSEHOLD;
      accountsToUpdate.add(a);
    }

    when 'Individual' {
      a.RecordTypeId = A_INDIVIDUAL;
      accountsToUpdate.add(a);
    }
  }
}
update accountsToUpdate;

/**
 *  Care Plans (Cases)
 */
Case [] casesToUpdate = new Case [] {};
Id C_CAREPLAN = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('CarePlan').getRecordTypeId();
Id C_CAREGAP = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('CareGap').getRecordTypeId();
for(Case c: [SELECT Id, HealthCloudGA__SortOrder__c FROM Case]) {
  if( c.HealthCloudGA__SortOrder__c == null ) {
    c.RecordTypeId = C_CAREPLAN;
    casesToUpdate.add(c);
  } else {
    c.RecordTypeId = C_CAREGAP;
    casesToUpdate.add(c);
  }
}
update casesToUpdate;