public with sharing class RESTRequestController {
    @AuraEnabled
    public static List<Account> getExternalData() {
        // The URL of the external API
        String apiUrl = 'https://dev-1ryx843z3515ih5.api.raw-labs.com/aura_JSON';

        // Make the REST request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiUrl);
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFUaERPVGc1TXpkQ1FUbENRVGd6TVRsRU1URTFOVFl3TVRrM1JUTkdRall6TWtNME1qSkZPUSJ9.eyJodHRwczovL3Jhdy1sYWJzLmNvbS9wZXJtaXNzaW9ucyI6W3siZGV2LTFyeXg4NDN6MzUxNWloNSI6eyJjb25zdW1lciI6WyIiXSwicHJvZHVjZXIiOlsiYWRtaW4iXX19XSwiaXNzIjoiaHR0cHM6Ly9yYXcuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDYzZTAxM2IzOTc3MTczMTM3ODIxODY4YSIsImF1ZCI6WyJodHRwczovL3Jhdy1sYWJzLmNvbS9yYXcvYWRtaW4iLCJodHRwczovL3Jhdy5ldS5hdXRoMC5jb20vdXNlcmluZm8iXSwiaWF0IjoxNjc1NjI5NDk1LCJleHAiOjE2NzU3MTU4OTUsImF6cCI6IkdPTFVIM05VM1dtY2R5T2tVekVCNHAwZ2FmN2N2NkhaIiwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBlbWFpbCIsInBlcm1pc3Npb25zIjpbXX0.hR9BFfg_LaIBS-iiqA-n-0RtTQqcnVLwswlqIgnq05BvAOyNoO7oTfNzVceRMHGJ4kCzcZrXJEaqX7yCJN4OLN_jLozKrJzVeXtmNro75mGG8NTxX0FwhoKWb2zqJOm8rjjk31EQeG4mu-wUx4SJNcN2VcAAwmDW0D0sQ5BzZGFjDjCBrO5iBlArRmMxNw26mxxmSJodIT2GBZFBEQuUCP-hwS91nGbboHz4h38dcDrL8VNjreWylG3TSMvfRewfiUp3Ewf82AGY71wkNijCeXm1F9LVH1V-Az8PKpds_uXqlTCLTot-z8jsEXDAArrXCAImRyB5q3tnoAWTFf0tjw');
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
