//Weather class
public with sharing class Testweather 
{
    public string city{get;set;}
    public string temp{get;set;}
    public string humid{get;set;}
    public string temp_min{get;set;}
    public string temp_max{get;set;}
    public string pressure{get;set;}

    public testweather(ApexPages.StandardController stdController) 
    {    
        Account account = (Account)stdController.getRecord();
        account=[Select Id, ShippingCity from Account where Id =:account.Id];
        System.debug('ID: '+account.Id);
        string accountCity = account.ShippingCity;
        string apiKey = '9c57ca3b22ba63f25e653f7a668b713d';
        string requestEndPoint = 'https://api.openweathermap.org/data/2.5/weather';
        requestEndPoint += '?q=' + accountCity;
        requestEndPoint += '&units=metrics';
        requestEndPoint += '&APPID=' + apiKey;
        System.debug('E: '+requestEndPoint);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint(requestEndPoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug('Code: '+response.getStatusCode());
        if(response.getStatusCode() == 200) 
    	{
        
            // deserialize json string into primitive data type.
            Map<String, Object> results =(Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            system.debug(results);
            city = String.valueOf(results.get('name'));
            Map<String, Object> mainResults=(Map<String, Object>)(results.get('main'));
            temp = String.valueOf(mainResults.get('temp'));
            pressure = String.valueOf(mainResults.get('pressure'));
            humid = String.valueOf(mainResults.get('humidity'));
            temp_min = String.valueOf(mainResults.get('temp_min'));
            temp_max = String.valueOf(mainResults.get('temp_max'));
    	}
    	else
        {
            ApexPages.message myMsg=new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error in reading data.');
    		ApexPages.addMessage(myMsg);
        }
    } 
}