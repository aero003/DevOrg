public class AnimalLocator 
{
	public static String getAnimalNameById(Integer i)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+i);
        request.setMethod('GET');
        HttpResponse response = http.send(request); 
        
        //System.debug('Response Body: '+response.getBody());
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        System.debug('Json DeserializedUntyped results: '+results);
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');
        /*System.debug('Results key Value: '+results.get('animal'));
          System.debug('Animal: '+animal);*/
        System.debug('Animal Name: '+String.valueOf(animal.get('name')));
        return String.valueOf(animal.get('name')); 
	}
}