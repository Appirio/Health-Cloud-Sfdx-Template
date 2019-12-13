public class HcCarePlansData {

    //assign to Mel
    
    public static void assignToUser(String n) {
        List<Case> cases = [SELECT Id, OwnerId, OwnerName__c  FROM Case WHERE OwnerName__c  =: n];

        //query user ID
        User u = [SELECT Id, Name FROM User WHERE Name =: n LIMIT 1];
        Id uId = u.Id;

        List<Case> csUpd = New List<Case>();

        for (Case c: cases){
            c.OwnerId = uId;
            csUpd.add(c);
        }
        update csUpd;

    }

}