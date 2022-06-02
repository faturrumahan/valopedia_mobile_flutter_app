import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:valopedia/detail_agent.dart';
import 'package:valopedia/detail_weapon.dart';

import 'package:valopedia/model/model_bundle.dart';
import 'package:valopedia/model/model_map.dart';
import 'package:valopedia/model/model_agent.dart';
import 'package:valopedia/model/model_weapon.dart';

import 'package:valopedia/func/source_data.dart';

class ListPage extends StatefulWidget {
  final String category;

  const ListPage({Key? key, required this.category}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 37, 46, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 70, 84, 1),
          title: Text('ValoPedia - ${widget.category}'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _buildListAgent(widget.category),
        ));
  }

  Widget _buildListAgent(String category) {
    String cat = category.toLowerCase();
    if (cat == 'agents') {
      return FutureBuilder(
        future: AgentDataSource.instance.loadAgent(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            AgentModel agentModel = AgentModel.fromJson(snapshot.data);
            return _buildSuccessAgentSection(agentModel, cat);
          }
          return _buildLoadingSection();
        },
      );
    } else if (cat == 'weapons') {
      return FutureBuilder(
        future: WeaponDataSource.instance.loadWeapon(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            WeaponModel weaponModel = WeaponModel.fromJson(snapshot.data);
            return _buildSuccessWeaponSection(weaponModel);
          }
          return _buildLoadingSection();
        },
      );
    } else if (cat == 'bundles') {
      return FutureBuilder(
        future: BundleDataSource.instance.loadBundle(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            BundleModel bundleModel = BundleModel.fromJson(snapshot.data);
            return _buildSuccessBundleSection(bundleModel);
          }
          return _buildLoadingSection();
        },
      );
    } else if (cat == 'maps') {
      return FutureBuilder(
        future: MapDataSource.instance.loadMap(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            MapModel mapModel = MapModel.fromJson(snapshot.data);
            return _buildSuccessMapSection(mapModel);
          }
          return _buildLoadingSection();
        },
      );
    } else {
      return _buildErrorSection();
    }
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessAgentSection(AgentModel agent, String category) {
    return ListView.builder(
      itemCount: agent.data?.length,
      itemBuilder: (BuildContext context, int index) {
        if (agent.data?[index].isPlayableCharacter == true) {
          return _buildItemAgents(
              category,
              "${agent.data?[index].uuid}",
              "${agent.data?[index].displayName}",
              "${agent.data?[index].description}",
              "${agent.data?[index].fullPortraitV2}",
              agent.data?[index].role,
              agent.data?[index].abilities);
        } else
          return Container();
      },
    );
  }

  Widget _buildSuccessWeaponSection(WeaponModel weapon) {
    return ListView.builder(
      itemCount: weapon.data?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemWeapons(
          "${weapon.data?[index].displayName}",
          "${weapon.data?[index].category}",
          "${weapon.data?[index].displayIcon}",
          weapon.data?[index].skins,
          weapon.data?[index].shopData,
        );
      },
    );
  }

  Widget _buildSuccessBundleSection(BundleModel bundle) {
    return ListView.builder(
      itemCount: bundle.data?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemBundles("${bundle.data?[index].displayName}",
            "${bundle.data?[index].displayIcon}");
      },
    );
  }

  Widget _buildSuccessMapSection(MapModel map) {
    return ListView.builder(
      itemCount: map.data?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemMaps(
          "${map.data?[index].displayName}",
          "${map.data?[index].splash}",
          "${map.data?[index].displayIcon}",
        );
      },
    );
  }

  Widget _buildItemAgents(String category, String uuid, String name,
      String desc, String photo, Role? role, List<Abilities>? abilities) {
    // return Text(value);
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            // return DetailAgentPage(uuid: id);
            return PageDetailAgent(
              name: name,
              photo: photo,
              desc: desc,
              role: role,
              abilities: abilities,
              uuid: uuid,
            );
          }));
        },
        child: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemWeapons(String name, String category, String photo,
      List<Skins>? skins, ShopData? shopData) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PageDetailWeapon(
              name: name,
              category: '${shopData?.category}',
              photo: photo,
              skins: skins,
              price: '${shopData?.cost}',
            );
          }));
        },
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemBundles(String name, String photo) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          final snackBar = SnackBar(
            duration: Duration(seconds: 1),
            content: Text(name),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Image.network(
          photo,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 5),
    );
  }

  Widget _buildItemMaps(String name, String photo, String icon) {
    if (name != 'The Range') {
      return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Container(child: _buildMapDialog(name, icon)));
                });
          },
          child: Image.network(
            photo,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(vertical: 5),
      );
    } else
      return Container();
  }

  Widget _buildMapDialog(String name, String map) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(name),
        Image.network(map),
      ],
    );
  }
}
