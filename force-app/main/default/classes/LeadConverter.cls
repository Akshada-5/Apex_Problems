public with sharing class LeadConverter {
    /**
     * Converts a lead into Account, Contact, and Opportunity
     * @param leadId The ID of the Lead to convert
     * @return Database.LeadConvertResult The result of the conversion
     */
    public static Database.LeadConvertResult convertLead(Id leadId) {
        if (leadId == null) {
            throw new AuraHandledException('Lead ID is required for conversion.');
        }

        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(leadId);

        // Finds the correct "Converted" status defined in your Org settings
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);

        // Standard conversion (creates Account, Contact, and Opportunity)
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        return lcr;
    }
}