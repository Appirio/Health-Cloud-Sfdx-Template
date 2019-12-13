//─────────────────────────────────────────────────────────────────────────────────────────────────┐
/**
 * @class       HcDemoPack_DataSetup
 * @description Implements a collection of static methods that can be used to create demo data.
 * @version     1.0.0
 * @public
 */
//─────────────────────────────────────────────────────────────────────────────────────────────────┘
public class HcTaskData {
/**
    //query specific account -- return Id
    public static Id queryRoy() {
    	Account a = [SELECT Id, Name FROM Account WHERE Name = 'Roy Green' LIMIT 1];
    	return a.Id;

    }

    //query specific users 
    public static  Id queryMelinda(){
    	User u = [SELECT Id, Name FROM User WHERE Name = 'Melinda Smith' LIMIT 1];
    	return u.Id;

    } 
    **/

//create task
    public static void createTasks() {
		Account a = [SELECT Id, Name FROM Account WHERE Name = 'Roy Green' LIMIT 1];
    	Id accId = a.Id;
    	User u = [SELECT Id, Name FROM User WHERE Name = 'Melinda Smith' LIMIT 1];
    	Id uId = u.Id;

    	Task n = new Task();
    	n.Subject = 'Notifcation: Patient Enrolled in Hip Replacement Program';
    	n.Description = 'Please complete onboarding steps';
    	n.WhatId = accId;
    	n.OwnerId = uId;
    	n.ActivityDate = Date.Today();

    	insert n;

    	Task n1 = new Task();
    	n1.Subject = 'Patients heart rate has spiked. Please review and call the patient/caregiver';
    	n1.Description = 'Please check in';
    	n1.WhatId = accId;
    	n1.OwnerId = uId;
    	n1.ActivityDate = Date.Today();

    	insert n1;

    }
}
