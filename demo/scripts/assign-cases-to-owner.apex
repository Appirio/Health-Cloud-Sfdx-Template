void assignToUser(String n) {
    User [] u = [SELECT Id, Name FROM User WHERE Name =: n LIMIT 1];

    if(u.size() == 0) {
      System.debug('User not found ' + n);
      return;
    }

    List<Case> csUpd = new List<Case>();

    for (Case c: [SELECT Id FROM Case WHERE OwnerName__c  =: n]){
        c.OwnerId = u[0].Id;
        csUpd.add(c);
    }

    update csUpd;
}

assignToUser('Peter Porter');
assignToUser('Sally Agent');