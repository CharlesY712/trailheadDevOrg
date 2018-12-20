@isTest
public class AnimalLocatorTest {
	    @isTest static void testGetCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        String actualValue = AnimalLocator.getAnimalNameById(1);
        String expectedValue = 'chicken';
        System.assertEquals(expectedValue, actualValue);
    }
}