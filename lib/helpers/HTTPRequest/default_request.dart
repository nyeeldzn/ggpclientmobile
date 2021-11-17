import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DefaultRequest {

   static String host = "";
   static Map<String, String> authHeaders = {};
   static bool isConnected = false;

    String getUrl(){
    return DefaultRequest.host;
  }

    void setUrl(String url, String port){
    host = url + ":" + port;
  }

    Future<bool> testConn(String url, String port, String encodedCredentials) async {
  authHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Basic ' + encodedCredentials,
  };
  var response = await http.get(Uri.parse(url + ":" + port + "/login"), headers: authHeaders);
  switch(response.statusCode){
      case 200:
        print(response.body);
        return true;
      case 401:
        return true;
      default:
        return false;
  }

  }

    Future<bool> setConn(String url, String port, String encodedCredentials) async{
     String localEncodedCredentials = encodedCredentials;
    print("Test Connection" + "\n URL: " + url + "\n Port: " + port + "\n Crendentials: " + encodedCredentials);
    bool state = await testConn(url, port, encodedCredentials);
    if(state){
      print("Connection Succeeded! Setting Up Helper");
      setUrl(url, port);
      authHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Basic ' + localEncodedCredentials,
      };
      print(authHeaders);
      isConnected = true;
      return true;
    }else{
      print("Connection Failure");
      isConnected = false;
      return false;
    }
  }

    //CRUD//

    Future<Response> getObject(String node) async {
      var response;
      if(isConnected){
         response = await http.get(Uri.parse(host  + node), headers: authHeaders);
        return response;
      }else{
        return response;
      }
  }

    Future<Response> getObjectWithId(String node, int id) async {
      var response;
      if(isConnected){
          response = await http.get(Uri.parse(host + node + "/$id"), headers: authHeaders);
          print(authHeaders);
        return response;
      }else{
        return response;
      }
  }

    Future<Response> getObjectWithText(String restNode) async {
       var response;
       if(isConnected){
          response = await http.get(Uri.parse(host + restNode), headers: authHeaders);
         return response;
       }else{
         return response;
       }
   }

    Future<Response> postObject(String json, String node) async{
      var response;
        if(isConnected){
            response = await http.post(
            Uri.parse(host + node),
            headers: authHeaders,
            body: json
            );
          return response;
        }
          return response;
      }

    Future<Response> updateObject(String json, String node, int id) async {
      var response;
        if(isConnected){
          response = await http.put(
            Uri.parse(host + node + "/" + id.toString()),
            headers: authHeaders,
            body: json
          );
          return response;
        }
          return response;
    }

    Future<Response> deleteObject(String node, int id) async {
      var response;
        if(isConnected){
          response = await http.delete(
            Uri.parse(host + node + "/" + id.toString()),
            headers: authHeaders,
            body: json
          );
          return response;
        }
          return response;
    }

}