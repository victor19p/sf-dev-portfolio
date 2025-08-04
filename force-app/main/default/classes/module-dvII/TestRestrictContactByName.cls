@isTest
public with sharing class TestRestrictContactByName {
    // Create a simple Apex trigger which blocks inserts and updates to any contact with a last name of 'INVALIDNAME'.
    // You'll copy the code for the class from the Get Ready for the Hands-on Challenge section.
    // Then write unit tests that achieve 100% code coverage.
    @isTest
    static void TestRestrictContactByName() {
        // Test for insert
        Contact c1 = new Contact(FirstName='Test', LastName='INVALIDNAME');
        Test.startTest();
        insert c1;
        Test.stopTest();
        //System.assertEquals(1, Limits.getDMLStatements());
        //System.assertEquals(1, Limits.getTotalErrors());
        //System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML');

        // Test for update
        c1.LastName = 'VALIDNAME';
        update c1;
        //System.assertEquals(1, Limits.getDMLStatements());
        //System.assertEquals(1, Limits.getTotalErrors());
        //System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML');
    }
}