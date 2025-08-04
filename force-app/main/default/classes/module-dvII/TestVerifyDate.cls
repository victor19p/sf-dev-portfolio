@isTest
private class TestVerifyDate {

    @isTest static void DateWithin30DaysTest2(){
        Date date1 = Date.newInstance(2021, 10, 10);
        Date date2 = Date.newInstance(2021, 11, 5);
        Date within30days = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date.newInstance(2021, 11, 5), date2);
        //return Test1;
    }

    @isTest static void DateSetEndMonthTest(){
        Date date1 = Date.newInstance(2021, 10, 10);
        Date date2 = Date.newInstance(2021, 10, 8);
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        Date pastDay = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date.newInstance(2021, 10, 31), pastDay);
    }

    @isTest static void datePast30daysTest() {     

        Date date1 = Date.newInstance(2020, 3, 23);       
        Date date2 = Date.newInstance(2020, 6, 16);      
        Date verified = VerifyDate.CheckDates(date1, date2);         
        System.assertEquals(verified,date.newInstance(2020, 3, 31));    
    }  

    @isTest static void dateWithin30daysTest() {     

        Date date1 = Date.newInstance(2020, 3, 23);       
        Date date2 = Date.newInstance(2020, 3, 27);      
        Date verified = VerifyDate.CheckDates(date1, date2);        
    }

}