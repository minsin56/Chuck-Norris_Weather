import 'package:http/http.dart' as http;

class BaseService 
{
  Future<String> Request(String URL, {dynamic Body, String? Method}) async
  {
    var Res = await http.get(Uri.parse(URL));
    return Res.body;
  }
}