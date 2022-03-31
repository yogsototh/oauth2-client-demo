var clientname="threatgrid-int";

var redirect_uri="https://localhost:5443/callback";

var oauthURLPrefix=null;
var response_type="code";
var client_id=null;
var client_password=null;
var scopes=[];

var authorizeSuffix="/iroh/oauth2/authorize";
var tokenSuffix="/iroh/oauth2/token";

switch (clientname) {
      case "AMPDevice":
            oauthURLPrefix="https://visibility.test.iroh.site";
      case "localtest":
            oauthURLPrefix="http://localhost:9001";
            response_type="code";
            client_id="localtest";
            client_password = "localpass";
            scopes=["profile"];
            redirect_uri="http://localhost:3001/callback";
            break;
      case "partial-test":
            oauthURLPrefix="https://visibility.int.iroh.site";
            response_type="code";
            client_id="client-f2fa0d2b-b95a-47dc-894f-83ea7311a86c";
            client_password = "vnUkviT6SmeHo4Nh8JmvAbDAP67brczsVwtjfAB1KZULrdff5jh1KA";
            scopes=["casebook",
                    "enrich:read",
                    "global-intel:read",
                    "inspect:read",
                    "integration:read",
                    "notification",
                    "orbital",
                    "profile",
                    "private-intel",
                    "response",
                    "registry/user/ribbon",
                    "telemetry:write",
                    "users:read"
                   ];
            redirect_uri="http://localhost:5443/callback";
            break;
      case "tgtest":
            oauthURLPrefix="https://visibility.test.iroh.site";
            response_type="code";
            client_id="client-0da6e30d-9656-4c33-b511-dadbc1018f02";
            client_password = "ZIGokk4ZuQkszTNy0B3LYfVc-NI5r0Nd_kFKoLZitVWeDU-5Wmx-mQ";
            scopes=["casebook",
                    "enrich:read",
                    "global-intel:read",
                    "inspect:read",
                    "integration:read",
                    "notification",
                    "orbital",
                    "profile",
                    "private-intel",
                    "response",
                    "registry/user/ribbon",
                    "telemetry:write",
                    "users:read"
                   ];
            redirect_uri="http://localhost:5443/callback";
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
      case "threatgrid-int":
            oauthURLPrefix="https://int.threatgrid.com";
            authorizeSuffix="/oauth2/authorize";
            tokenSuffix="/api/v3/oauth/token"
            response_type="code";
            client_id="44e6f7fc-fc4d-4b4b-a0a1-160195e928c6";
            client_password = "pok4e6k5cp6lc4af0reto8i6emil7cek";
            scopes=[ "openid", "threatgrid:profile" ];
            redirect_uri="https://visibility.int.iroh.site/iroh/iroh-auth/login/idb-tg-staging/answer";
            break;
      case "threatgrid-test":
            oauthURLPrefix="https://int.threatgrid.com";
            authorizeSuffix="/oauth2/authorize";
            tokenSuffix="/api/v3/oauth/token"
            response_type="code";
            client_id="3184";
            client_password = "4vj7fvrt00ob2hsvcldceicgl1c9htpc";
            scopes=[ "openid", "threatgrid:profile" ];
            redirect_uri="https://visibility.test.iroh.site/iroh/iroh-auth/login/idb-tg-staging/answer";
            break;
      default:
            alert("OAuth2 Client Demo: I don't know your client (" + clientname + "). Change it in info.js.");
}

var oauthServerUrl=oauthURLPrefix + authorizeSuffix;
var oauthServerTokenUrl=oauthURLPrefix + tokenSuffix;
var resourceProviderTestEndpoint=oauthURLPrefix + "/iroh/profile/whoami" ;
var scope=scopes.join(" ");
var state="whatever=";
