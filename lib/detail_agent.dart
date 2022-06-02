import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valopedia/home_page.dart';
import 'package:valopedia/model/model_agent.dart';

class PageDetailAgent extends StatefulWidget {
  final String name;
  final String desc;
  final String photo;
  final Role? role;
  final List<Abilities>? abilities;
  final String uuid;

  const PageDetailAgent({
    Key? key,
    required this.name,
    required this.desc,
    required this.photo,
    required this.role,
    required this.abilities,
    required this.uuid,
  }) : super(key: key);

  @override
  _PageDetailAgentState createState() => _PageDetailAgentState();
}

class _PageDetailAgentState extends State<PageDetailAgent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
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
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: _buildDetail(widget.name, widget.photo, widget.desc,
                widget.role, widget.abilities),
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(String name, String photo, String desc, Role? role,
      List<Abilities>? abilities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Image.network(
                photo,
                height: 250,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            _buildRole(role),
          ],
        ),

        _buildDesc(desc),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
          child: Text(
            'Abilities',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(28, 37, 46, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildAbilities(abilities),
                )
            )
        ),
      ],
    );
  }

  Widget _buildRole(Role? role) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${role?.displayName}\n',
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildDesc(String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
          child: Text(
            'Description',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          desc + '\n',
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildAbilities(List<Abilities>? abilities) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext ctx, int i) {
          return _buildAbiDetail("${abilities?[i].displayName}",
              "${abilities?[i].description}", "${abilities?[i].displayIcon}");
        },
    );
  }

  Widget _buildAbiDetail(String name, String desc, String icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '- ' + name + ' ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Image.network(
              icon,
              height: 20,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            desc + '\n',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
