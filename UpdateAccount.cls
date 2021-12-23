public class UpdateAccount {
    public static void updateAccountRating( List<Opportunity> oppList){
        Set <Id> accIds = new Set<Id>();
        List <Account> accToUpdate = new List <Account>();
        
        //checking if opportuniyt list is not empty
        if( !oppList.isEmpty()){
            for(Opportunity opp : oppList){
                if(opp.StageName == 'Closed Won'){
                    accIds.add(opp.AccountId);
                }
            }
        }
        
        if(!accIds.isEmpty()){
            List <Account> accList = [SELECT Id FROM Account WHERE Id In : accIds ];
            if(!accList.isEmpty()){
                for(Account acc : accList){
                    acc.Rating = 'Hot';
                    accToUpdate.add(acc);
                }
            }
        }
        
        if(!accToUpdate.isEmpty()){
            update accToUpdate;
        }
    }
}
