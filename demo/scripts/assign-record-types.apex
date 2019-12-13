/**
 *  Accounts
 */
Account [] accountsToUpdate = new Account [] {};
for(Account a: [SELECT Id, HealthCloudGA__IndividualType__c FROM Account]) {
  switch on a.HealthCloudGA__IndividualType__c {
    when 'Group' {
      a.RecordTypeId = RecordType.Account.IndustriesHousehold;
      accountsToUpdate.add(a);
    }

    when 'Individual' {
      a.RecordTypeId = RecordType.Account.IndustriesIndividual;
      accountsToUpdate.add(a);
    }
  }
}
update accountsToUpdate;

/**
 *  Care Plans (Cases)
 */
Case [] casesToUpdate = new Case [] {};
for(Case c: [SELECT Id, HealthCloudGA__SortOrder__c FROM Case]) {
  switch on c.HealthCloudGA__SortOrder__c {
    when null {
      c.RecordTypeId = RecordType.Contact.CarePlan;
      casesToUpdate.add(c);
    }
    when else {
      c.RecordTypeId = RecordType.Contact.CareGap;
      casesToUpdate.add(c);
    }
  }
}
update casesToUpdate;