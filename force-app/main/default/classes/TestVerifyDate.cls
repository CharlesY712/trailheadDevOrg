@isTest
public class TestVerifyDate {
	@isTest static void testVerifyDate2InPast() {
        Date day = VerifyDate.CheckDates(Date.newInstance(2019, 12, 11), Date.newInstance(2019, 12, 01));
        System.assertEquals(Date.newInstance(2019, 12, 31), day);
    }
    
    @isTest static void testVerifyDate2Within30DaysOfDate1() {
        Date day = VerifyDate.CheckDates(Date.newInstance(2019, 12, 01), Date.newInstance(2019, 12, 11));
        System.assertEquals(Date.newInstance(2019, 12, 11), day);
    }
       
    @isTest static void testVerifyEndOfMonthDate() {
        Date day = VerifyDate.CheckDates(Date.newInstance(2019, 12, 11), Date.newInstance(2020, 01, 21));
		System.assertEquals(Date.newInstance(2019, 12, 31), day);
    }
}