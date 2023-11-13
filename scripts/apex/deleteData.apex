List<String> objectNames = new List<String>{
    
    'LoyaltyProgramCurrency',
    'LoyaltyTierGroup',
    'LoyaltyTier',
    'BenefitType',
    'LoyaltyTierBenefit',
    'Benefit',
    'JournalType',
    'JournalSubType',
    'LoyaltyProgramBadge',
    'VoucherDefinition',
    'Promotion',
    'LoyaltyProgram'
};

for (String objectName : objectNames) {
    String dynamicQuery = 'SELECT Id FROM ' + objectName;
    List<SObject> recordsToDelete = Database.query(dynamicQuery);

    if (!recordsToDelete.isEmpty()) {
        try {
            delete recordsToDelete;
            System.debug('Deleted ' + recordsToDelete.size() + ' ' + objectName + ' records.');
        } catch (DmlException e) {
            for (Integer i = 0; i < e.getNumDml(); i++) {
                System.debug('Error deleting record ' + recordsToDelete[i] + ': ' + e.getDmlMessage(i));
            }
        }
    }
}
