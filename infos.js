var oauthURLPrefix="http://localhost:9001";
var oauthServerUrl=oauthURLPrefix + "/iroh/oauth2/authorize";
var oauthServerTokenUrl=oauthURLPrefix + "/iroh/oauth2/token";
var resourceProviderTestEndpoint=oauthURLPrefix + "/iroh/iroh-ui-settings/whoami" ;
var response_type="token";
var client_id="localtest";
var client_password = "localpass";
var redirect_uri="http://localhost:9999/implicit.html";
var scopes=[ "private-intel"
           , "ui-settings"
           //  , inexistant
           ];
var scope=scopes.join(" ");
var state="whatever";
