@isTest
public class UpdateAccountTest {
    @isTest
    public static void updateAccountRating(){
        Account acc =  new Account();
        acc.Name = 'Shivam Yadav';
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opp';
        opp.StageName = 'Closed Won';
        opp.AccountId = acc.Id;
        test.startTest();
        List <Account> accList = [SELECT Id, Rating FROM Account WHERE Id =: opp.AccountId];
        System.assertEquals(accList.get(0).Rating, 'Hot');
        test.stopTest();
    }
}
