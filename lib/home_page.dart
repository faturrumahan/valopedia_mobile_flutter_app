import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:valopedia/data_list.dart';
import 'package:valopedia/fav_skin_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imgSrc = [
    'https://images2.alphacoders.com/120/thumb-1920-1204924.jpg',
    'https://wallpapercave.com/wp/wp6012294.jpg',
    'https://w0.peakpx.com/wallpaper/143/4/HD-wallpaper-viper-new-cool-valorant.jpg',
  ];

  final categories = [
    'AGENTS',
    'WEAPONS',
    'BUNDLES',
    'MAPS',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 37, 46, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 70, 84, 1),
        title: Text('ValoPedia'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FavoriteListPage();
                }));
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Welcome Player',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: _topCard(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: _buildMenu(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topCard() {
    return Center(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          enlargeCenterPage: true,
        ),
        itemCount: imgSrc.length,
        itemBuilder: (context, index, realIndex) {
          final img = imgSrc[index];
          return _buildImage(img, index);
        },
      ),
    );
  }

  Widget _buildImage(String img, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMenu() {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = categories[index];
        return _buildItemCategories(category, index);
      },
    );
    // return Text('data');
  }

  Widget _buildItemCategories(String category, int index) {
    // return Text(category);
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ListPage(category: category);
          }));
        },
        child: SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(category),
            ],
          ),
        ),
      ),
    );
  }
}
