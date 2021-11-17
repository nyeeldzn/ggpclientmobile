import 'dart:convert';

import 'package:ggpmobile/models/user.dart';
import 'package:ggpmobile/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';

class LoginRequest{

  static late User currentUser;

  Future<int> login(User user) async {
    String stringConcCredential = user.username.trim().toUpperCase() + ":" + user.pass.trim().toUpperCase();
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedCredentials = stringToBase64.encode(stringConcCredential);
    print("Encoded Credentials: " + encodedCredentials);

    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
      'Authorization' : 'Basic ' + encodedCredentials,
    };

    String url = DefaultRequest().getUrl() + "/login";
    var response = await http.post(
        Uri.parse(url),
        headers: requestHeaders,
        body: User.toJson(user)
    );
    switch (response.statusCode){
        case 200:
          print(response.body);
          currentUser = await User.fromJson(jsonDecode(response.body));
          DefaultRequest.authHeaders = requestHeaders;
          return 1;
        case 401:
          print("Usuario Nao Autorizado");
          return 2;
        default:
          print("Nao foi possivel realizar a conexao \n Erro " + response.statusCode.toString());
          return 0;
    }
  }


}