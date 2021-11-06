import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DefaultRequest {

   String url = "";
   String port = "";
   late final Map<String, String> authHeaders;
   bool isConnected = false;


  Future<bool> testConn(String url, String port, String encodedCredentials) async {
  authHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Basic ' + encodedCredentials,
  };
  var response = await http.get(Uri.parse(url + ":" + port + "/usuarios"), headers: authHeaders);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  switch(response.statusCode){
      case 200:
        return true;
      case 401:
        return true;
      default:
        return false;
  }

  }

  bool setConn(String url, String port, String encodedCredentials){
    print("Test Connection" + "\n URL: " + url + "\n Port: " + port + "\n Crendentials: " + encodedCredentials);
    bool state = testConn(url, port, encodedCredentials) as bool;
    if(state){
      print("Connection Succeeded! Setting Up Helper");
      this.url = url;
      this.port = port;
      authHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Basic ' + encodedCredentials,
      };
      this.isConnected = true;
      return true;
    }else{
      print("Connection Failure");
      this.isConnected = false;
      return false;
    }
  }

  Future<Response> getObject(String node) async {
    var response;
    if(isConnected){
      response = await http.get(Uri.parse(url + ":" + port + node), headers: authHeaders);
      return response;
    }else{
      return response;
    }
  }

  Future<Response> getObjectWithId(String node, int id) async {
    var response;
    if(isConnected){
      response = await http.get(Uri.parse(url + ":" + port + node + "/$id"));
      return response;
    }else{
      return response;
    }
  }


}