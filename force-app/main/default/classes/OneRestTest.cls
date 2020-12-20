@isTest
public class OneRestTest {
        public static testMethod void TestGet() {
        Test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/OneRest/ping'; 
        req.httpMethod = 'GET'; 
        RestContext.request = req;
        RestContext.response = res;
        req.requestBody = Blob.valueof('');       
        OneRest.GetHandler();
   		Test.stopTest(); 
    }
    public static testMethod void TestPost() {
        Test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/OneRest/ping'; 
        req.httpMethod = 'POST'; 
        RestContext.request = req;
        RestContext.response = res;
        req.requestBody = Blob.valueof('');    
        OneRest.PostHandler();
   		Test.stopTest(); 
    }
    public static testMethod void TestPatch() {
        Test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/OneRest/ping'; 
        req.httpMethod = 'PATCH'; 
        RestContext.request = req;
        RestContext.response = res;
        req.requestBody = Blob.valueof('');    
        OneRest.PatchHandler();
   		Test.stopTest(); 
    }
    public static testMethod void TestDelete() {
        Test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/OneRest/ping'; 
        req.httpMethod = 'DELETE'; 
        RestContext.request = req;
        RestContext.response = res;
        req.requestBody = Blob.valueof('');    
        OneRest.DeleteHandler();
   		Test.stopTest(); 
    }
    public static testMethod void TestPut() {
        Test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/OneRest/ping'; 
        req.httpMethod = 'PUT'; 
        RestContext.request = req;
        RestContext.response = res;
        req.requestBody = Blob.valueof('');    
        OneRest.PutHandler();
   		Test.stopTest(); 
    }

}