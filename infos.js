var oauthServerUrl="http://localhost:9001/iroh/oauth2/authorize";
var response_type="code";
var client_id="localtest";
var client_password = "localpass";
var redirect_uri="http://localhost:9999/login.html";
var scopes=["casebook"
            ,"collect"
            ,"ctia"
            ,"enrich"
            ,"inspect"
            ,"integration"
            ,"iroh-auth"
            ,"response"
            ,"ui-settings"];
var scope=scopes.join(" ");
var state="whatever";
