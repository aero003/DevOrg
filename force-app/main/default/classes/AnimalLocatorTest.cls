@isTest
private class AnimalLocatorTest 
{
	@isTest
    static void animalLocatorTest()
    {
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(5); 
        String expected = 'moose';
        System.assertEquals(actual, expected);
    }
}