import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class ImgFullscreen extends StatefulWidget {
  final String imgUrl;

  const ImgFullscreen({Key? key, required this.imgUrl}) : super(key: key);

  @override
  _ImgFullscreenState createState() => _ImgFullscreenState();
}

class _ImgFullscreenState extends State<ImgFullscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Download",style: TextStyle(color: Colors.blueGrey),),
        ),
        onPressed: (){
          setWallpaper(widget.imgUrl,context);
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.imgUrl), 
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  
  Future<void> setWallpaper(String wallpaperURL, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download Started...")));
  
  FileDownloader.downloadFile(
    url: wallpaperURL,
    onDownloadCompleted: (value){
      print(value);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded Successfully")));
    }
    );
}

}
