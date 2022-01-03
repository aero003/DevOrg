public class ParkLocator 
{
	public static List<String> country(String country)
    {
        ParkService.ParksImplPort pip = new ParkService.ParksImplPort();
        System.debug('pip: '+pip.byCountry(country));
        return pip.byCountry(country);
	}
}