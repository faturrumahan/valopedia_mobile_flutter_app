import 'package:flutter/material.dart';
import 'package:valopedia/home_page.dart';
import 'package:valopedia/model/model_weapon.dart';
import 'package:valopedia/skin_list.dart';

class PageDetailWeapon extends StatefulWidget {
  final String name;
  final String category;
  final String photo;
  final List<Skins>? skins;
  final String price;
  
  const PageDetailWeapon({Key? key,
    required this.name,
    required this.category,
    required this.photo,
    required this.skins,
    required this.price,
  }) : super(key: key);

  @override
  _PageDetailWeaponState createState() => _PageDetailWeaponState();
}

class _PageDetailWeaponState extends State<PageDetailWeapon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 37, 46, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 70, 84, 1),
        title: Text('ValoPedia'),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.network(widget.photo),
            SizedBox(
              height: 70,
            ),
            Text("Name : "+ widget.name, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 20),),
            SizedBox(
              height: 30,
            ),
            Text("Type : "+ widget.category, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 20),),
            SizedBox(
              height: 30,
            ),
            Text("Price : "+ widget.price, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 20),),
            // Text('Skin List'),
            // Expanded(child: _buildSkins(widget.skins, widget.name)),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SkinListPage(skins: widget.skins, name: widget.name);
                  }));
                },
                child: Text('Weapon Skins')
            )
          ],
        ),
      ),
    );
  }
}
