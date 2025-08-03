public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx){
        List<Lead> leadList = [SELECT Id, LeadSource 
                              FROM Lead
                              WHERE LeadSource = ''
                              LIMIT 200];
        List<Lead> updateList = new List<Lead>();
        if(!leadList.isEmpty()){
            for(Lead ld : leadList){
            	ld.LeadSource = 'Dreamforce';
        	}
        }
        
        
        update leadList;
    }
}