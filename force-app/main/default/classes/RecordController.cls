/**
 * @description       : 
 * @author            : NiyogAethereus
 * @group             : 
 * @last modified on  : 03-16-2023
 * @last modified by  : NiyogAethereus
**/
public with sharing class RecordController {
    @AuraEnabled(cacheable=true)
    public static List<sObject> getRecords(String objectName) {
        String soql = 'SELECT ';
        String fields = '';
        switch on objectName {
            when 'Lead' {
                fields = 'Name, Company, Title';
            }
            when 'Account' {
                fields = 'Name, Type, Industry';
            }
            when 'Contact' {
                fields = 'Name, Email, Phone';
            }
            when 'Task' {
                fields = 'Subject, Status, Priority';
            }
            when else {
                return new List<sObject>();
            }
        }
        soql += fields + ' FROM ' + objectName ;
        return Database.query(soql);
    }
    @AuraEnabled
    public static Id createRecord(SObject record) {
        try {
            insert record;
            return record.Id;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    }
    

