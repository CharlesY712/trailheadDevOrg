@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String loc = 'Germany';
        List<String> result = ParkLocator.country(loc);
        // Verify that a fake result is returned
        System.assertEquals('Big Park', result[0]); 
    }
}