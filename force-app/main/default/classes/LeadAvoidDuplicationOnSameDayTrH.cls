public class LeadAvoidDuplicationOnSameDayTrH extends SobjectTriggerHandler{
    @TestVisible
    private List<Lead> newLead;
    public LeadAvoidDuplicationOnSameDayTrH(){
        this((List<Lead>) Trigger.new);
    }
    public LeadAvoidDuplicationOnSameDayTrH(List <Lead> newLead){
        this.newLead = newLead;
    }
    public override void beforeInsert(){
        avoidDuplicationLead();
    }
    public void avoidDuplicationLead(){
        List<Lead> Leads = [select id , LastName, Email from Lead Where CreatedDate = today ];
        List<String> Emails = new List<String>();
        List<String> LastNames = new List<String>();
        if(!Leads.isEmpty()){
            for(Lead objLead : Leads ){
                Emails.add(objLead.Email);
                LastNames.add(objLead.LastName);
            }
        }
        for(Lead objLead : newLead){
            if(Emails.contains(objLead.Email) && LastNames.contains(objLead.LastName)){
                objLead.addError('You Cannot Create New Lead Because You created already today itself');
            }
        }
    } 
}