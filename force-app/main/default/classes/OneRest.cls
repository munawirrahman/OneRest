/*
 * @Description: Rest API with Flow Builder as Controller
 * @Author: munawirrahman@gmail.com
 * visit munawirrahman.medium.com for more info
*/

@RestResource(urlMapping='/OneRest/*')

global with sharing class OneRest {
    
@HttpPost
    global static void PostHandler() {
        RequestHandler();
    }

@HttpGet
    global static void GetHandler() {
        RequestHandler();
    }
@HttpDelete
    global static void DeleteHandler() {
        RequestHandler();
    }
@HttpPatch
    global static void PatchHandler() {
        RequestHandler();
    }
@HttpPut
    global static void PutHandler() {
        RequestHandler();
    }    
    global static String RequestHandler() {
        RestRequest req = RestContext.request;
        String RequestUri = req.requestURI;
        String RequestMethod = req.httpMethod;
        String RequestBody = req.requestBody.tostring();
        String RequestHeaders_JSON = JSON.serialize(req.headers); //headers in JSON type
        String RequestParams_JSON = JSON.serialize(req.params); //params (query strings) in JSON type
        String RequestRemoteAddress = req.remoteAddress;
        System.debug('Incoming request URL: '+RequestUri);
        System.debug('Incoming request method: '+RequestMethod);
        System.debug('Incoming request params (in JSON): '+RequestParams_JSON);
        System.debug('Incoming request Headers (in JSON): '+RequestHeaders_JSON);
        System.debug('Incoming request body: '+RequestBody);        
        System.debug('Incoming request from IP: '+RequestRemoteAddress);
        String[] paths = RequestUri.split('/');
        String RequestPath1 = path_checker(paths,2);
        String RequestPath2 = path_checker(paths,3);
        String RequestPath3 = path_checker(paths,4);
        String RequestPath4 = path_checker(paths,5);
        String RequestPath5 = path_checker(paths,6);
        
        Map<String, Object> MapFlow = new Map<String, Object>();
        MapFlow.put('RequestMethod', RequestMethod);
        MapFlow.put('RequestParams_JSON', RequestParams_JSON);
        MapFlow.put('RequestHeaders_JSON', RequestHeaders_JSON);
        MapFlow.put('RequestPath1', RequestPath1);
        MapFlow.put('RequestPath2', RequestPath2);
        MapFlow.put('RequestPath3', RequestPath3);
        MapFlow.put('RequestPath4', RequestPath4);
        MapFlow.put('RequestPath5', RequestPath5);
        MapFlow.put('RequestBody', RequestBody);
        MapFlow.put('RequestRemoteAddress',RequestRemoteAddress);
        
        System.debug('Running flow...');
        //OneRestController = flow api name
        Flow.Interview.OneRestController myFlow = new Flow.Interview.OneRestController(MapFlow);
		myFlow.start();
        System.debug('Flow finished.');
        String ResponseBody = myFlow.ResponseBody;
        Decimal ResponseStatusCode = myFlow.ResponseStatusCode;
        String ResponseContentType = myflow.ResponseContentType;
        System.debug('flow output is: ' + ResponseBody+ ' with status code: '+ResponseStatusCode+ ' and Content-Type: '+ResponseContentType);
        RestResponse res = RestContext.response;
        res.addHeader('Content-Type', ResponseContentType);
        res.responseBody = Blob.valueOf(ResponseBody);
        res.StatusCode = Integer.valueOf(ResponseStatusCode);
        return null;
    }
    
    global static string path_checker(List<String>paths, Integer index){
        String path;
        try{
            path = paths[index];
            System.debug('path number: '+ index + ' = ' + path);
        }
        catch(Exception e){
            System.debug('path number: '+ index + ' error= ' +e.getMessage());
            path = null;
        }
        return path;
    }
}