import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:valopedia/model/model_database.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({Key? key}) : super(key: key);

  @override
  _FavoriteListPageState createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  Box<FavoriteSkin> favDB = Hive.box<FavoriteSkin>('favorite_skin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 37, 46, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 70, 84, 1),
        title: Text('Favorite Skin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_buildList()],
        ),
      ),
    );
  }

  Widget _buildList() {
    return ValueListenableBuilder(
      valueListenable: favDB.listenable(),
      builder: (BuildContext context, Box<dynamic> value, Widget? child) {
        if (value.isEmpty) {
          return Center(
              child: Text(
                  'No Favorite Skins',
                  style: TextStyle(color: Colors.white),
              )
          );
        }

        return Expanded(
          child: ListView.builder(
            itemCount: favDB.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildItemSkin(
                  favDB.getAt(index)!.name, favDB.getAt(index)!.photo, index);
            },
          ),
        );
      },
    );
  }

  Widget _buildItemSkin(String name, String photo, int index) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child:
                        Container(child: _buildSkinDialog(name, photo, index)));
              });
        },
        child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    photo,
                    height: 65,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkinDialog(String name, String photo, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Image.network(photo),
        IconButton(
            onPressed: () {
              favDB.deleteAt(index);
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete))
      ],
    );
  }
}
