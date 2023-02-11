public with sharing class RESTRequestController {
    @AuraEnabled
    public static List<Account> getExternalData() {
        // The URL of the external API
        String apiUrl = 'https://dev-1ryx843z3515ih5.api.raw-labs.com/aura_JSON';

        // Make the REST request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiUrl);
        request.setHeader('Authorization', 'Bearer token');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            List<Account> accounts = (List<Account>) JSON.deserialize(response.getBody(), List<Account>.class);
            return accounts;
        }
        return null;
    }

    
    @AuraEnabled
    public static void updateRecords(List<Account> accounts) {
        accounts = getExternalData();
        insert accounts;
    }
}
