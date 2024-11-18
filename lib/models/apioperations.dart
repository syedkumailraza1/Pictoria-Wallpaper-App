import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pictoria/models/photomodel.dart';

class APIOper {
  static List<PhotosModel> wall = [];
  
  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    try {
      var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?"),
        headers: {"Authorization": "sMeoPQFHCWHgrfvoB6YP1fyj9b2gra39SQb9hsudmm94pf02wJaeUG2W"},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List photos = jsonData["photos"];
        photos.forEach((element) {
          wall.add(PhotosModel.fromAPI(element));
        });
        return wall;
      } else {
        print('Request failed with status: ${response.statusCode}');
        print("the error is : ${response.body}");
      }
    } catch (e) {
      print('Error: $e');
    }

    return wall;
  }


   static List<PhotosModel> SearchWallpaperList = [];
   static Future<List<PhotosModel>> SearchWallpapers(String query) async {  
    try {
      var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {"Authorization": "sMeoPQFHCWHgrfvoB6YP1fyj9b2gra39SQb9hsudmm94pf02wJaeUG2W"},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List photos = jsonData["photos"];
        SearchWallpaperList.clear();
        photos.forEach((element) {
          SearchWallpaperList.add(PhotosModel.fromAPI(element));
        });
        return SearchWallpaperList;
      } else {
        print('Request failed with status: ${response.statusCode}');
        print("the error is : ${response.body}");
      }
    } catch (e) {
      print('Error: $e');
    }

    return SearchWallpaperList;
  }

   


}
