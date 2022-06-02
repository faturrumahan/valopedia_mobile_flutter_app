import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:valopedia/home_page.dart';
import 'package:valopedia/model/model_weapon.dart';
import 'package:valopedia/model/model_database.dart';

class SkinListPage extends StatefulWidget {
  final List<Skins>? skins;
  final String name;

  const SkinListPage({
    Key? key,
    required this.skins,
    required this.name,
  }) : super(key: key);

  @override
  _SkinListPageState createState() => _SkinListPageState();
}

class _SkinListPageState extends State<SkinListPage> {
  Box<FavoriteSkin> favDB = Hive.box<FavoriteSkin>('favorite_skin');
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 37, 46, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 70, 84, 1),
          title: Text(widget.name + ' Skins'),
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }), (route) => false);
              },
            )
          ],
        ),
        body: Container(
            margin: EdgeInsets.all(12),
            child: _buildSkinList(widget.skins, widget.name)
        )
    );
  }

  Widget _buildSkinList(List<Skins>? skins, nama) {
    return ListView.builder(
        itemCount: skins?.length,
        itemBuilder: (BuildContext context, int index) {
          String? name = skins?[index].displayName;
          String? names = 'Standard ' + nama;
          if (skins?[index].displayIcon != null && name != names) {
            return _buildItemSkin(
                '${skins?[index].displayName}', '${skins?[index].displayIcon}');
          } else
            return Container();
        });
  }

  Widget _buildItemSkin(String name, String photo) {
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
                    child: Container(child: _buildSkinDialog(name, photo)));
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

  Widget _buildSkinDialog(String name, String photo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Image.network(photo),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: IconButton(
              onPressed: () {
                var favLength = favDB.length;
                liked=false;
                for(var i = 0; i < favLength; i++) {
                  if(name == favDB.getAt(i)!.name){
                    liked = true;
                    // favDB.deleteAt(i);
                    final snackBar = SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(name + ' already favorited'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    break;
                  }
                }
                if(!liked) {
                  liked = false;
                  favDB.add(FavoriteSkin(
                    name: name,
                    photo: photo,
                  ));
                  Navigator.pop(context);
                }
              },
              icon: Icon(Icons.favorite_outline)),
        )
      ],
    );
  }
}
