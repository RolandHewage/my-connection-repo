import ballerina/http;
import ballerina/log;
import ballerina/os;

string IDM_HR_Integration_URL = os:getEnv("CHOREO_MY_GO_SERVICE_API_CONNECT_SERVICEURL");
string IDM_HR_Integration_clientID = os:getEnv("CHOREO_MY_GO_SERVICE_API_CONNECT_CONSUMERKEY");
string IDM_HR_Integration_clientSecret = os:getEnv("CHOREO_MY_GO_SERVICE_API_CONNECT_CONSUMERSECRET");
string IDM_HR_Integration_tokenUrl = os:getEnv("CHOREO_MY_GO_SERVICE_API_CONNECT_TOKENURL");
string IDM_HR_Integration_theAPIKey = os:getEnv("CHOREO_MY_GO_SERVICE_API_CONNECT_CHOREOAPIKEY");

public function main() returns error? {
    http:Client httpclient = check new(
        IDM_HR_Integration_URL,
        auth = {
            tokenUrl: IDM_HR_Integration_tokenUrl,
            clientId: IDM_HR_Integration_clientID,
            clientSecret: IDM_HR_Integration_clientSecret
        });

    http:Response response = check httpclient->get("/greeter/greet?name=as");  

    log:printInfo("LOG-IDM-HR-SCHEDULER triggered " + IDM_HR_Integration_URL + "/greeter/greet?name=as");
    log:printInfo("LOG-IDM-HR-SCHEDULER Scheduled task response code: " + response.statusCode.toString());

    return();
}
