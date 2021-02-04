var clientname="int-posture";

var redirect_uri="https://localhost:5443/callback";

var oauthURLPrefix=null;
var response_type="code";
var client_id=null;
var client_password=null;
var scopes=[];

switch (clientname) {
    case "localtest":
      oauthURLPrefix="http://localhost:9001";
      response_type="code";
      client_id="localtest";
      client_password = "localpass";
      scopes=["profile"];
      redirect_uri="http://localhost:3001/callback";
      break;
    case "int-openid":
      oauthURLPrefix="https://visibility.int.iroh.site";
      response_type="code";
      client_id="client-92258bc0-196a-4f6c-a0b5-fe105de5f505";
      client_password = "xoM2Gisjqp7Sp1jnw9Y6Yce9gfg4hmoRxZTekLqKi6i7o1xBiPvLvA";
      scopes=[ "openid" ];
      break;
    case "int-posture":
      oauthURLPrefix="https://visibility.int.iroh.site";
      response_type="code";
      client_id="client-7230cfcf-648e-4b95-b85f-f73fe33fa0c3";
      client_password = "vC9S-hvbBxQtbNQ6h__IekcFb7k9pTJuIbUKHH1rEQUgvkjpGjExhw";
      scopes=[ "openid", "profile" ];
      break;
    default:
      alert("I don't know your client.");
}

var oauthServerUrl=oauthURLPrefix + "/iroh/oauth2/authorize";
var oauthServerTokenUrl=oauthURLPrefix + "/iroh/oauth2/token";
var resourceProviderTestEndpoint=oauthURLPrefix + "/iroh/profile/whoami" ;
var scope=scopes.join(" ");
var state="whatever=";
