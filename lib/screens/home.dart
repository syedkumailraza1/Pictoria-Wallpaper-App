import 'package:flutter/material.dart';
import 'package:pictoria/models/apioperations.dart';
import 'package:pictoria/models/photomodel.dart';
import 'package:pictoria/screens/imgfull.dart';
import 'package:pictoria/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<PhotosModel>> _futureWallpapers;

  @override
  void initState() {
    super.initState();
    _futureWallpapers = APIOper.getTrendingWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pictoria'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchWidget(),
          Expanded(child: trending()),
        ],
      ),
    );
  }

  Widget trending() {
    return FutureBuilder<List<PhotosModel>>(
      future: _futureWallpapers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<PhotosModel> trendingWallList = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemCount: trendingWallList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ImgFullscreen(imgUrl: trendingWallList[index].imgSrc),
                      ),
                    );
                  },
                  child: Hero(
                    tag: trendingWallList[index].imgSrc,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        trendingWallList[index].imgSrc,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }
}
