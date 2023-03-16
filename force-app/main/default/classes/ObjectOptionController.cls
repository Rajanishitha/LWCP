/**
 * @description       : 
 * @author            : NiyogAethereus
 * @group             : 
 * @last modified on  : 03-16-2023
 * @last modified by  : NiyogAethereus
**/
public with sharing class ObjectOptionController {
    @AuraEnabled(cacheable=true)
    public static List<ObjectOptions__mdt> getObjectOptions() {
        return [SELECT Object__c, Label, Field1__c, Field2__c, Field3__c FROM ObjectOptions__mdt ORDER BY Label];
    }
}
