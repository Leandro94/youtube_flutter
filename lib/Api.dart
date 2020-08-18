import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API= "AIzaSyD4KKZt5SJyVvAUEodWEAhldX_DFu3l7G4";
const ID_CANAL= "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE= "https://www.googleapis.com/youtube/v3/";

class Api{
  pesquisar(String pesquisa) async{
    http.Response response = await http.get(
      URL_BASE + "search" + "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL"
          "&q=$pesquisa"
    );

    if(response.statusCode==200){
      Map<String, dynamic> dadosJson = json.decode(response.body);
      print("resultado: "+  dadosJson[""]);
    }
  }
}