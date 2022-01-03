@isTest
public class ParkLocatorTest 
{
	@isTest
    static void testCallout()
    {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'United States';
        List<String> parkList = new List<String> {'Yosemite', 'Sequoia', 'Crater Lake'};
        System.assertEquals(parkList, ParkLocator.country(country));
    }
}