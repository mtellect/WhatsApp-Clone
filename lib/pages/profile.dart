import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileView extends StatelessWidget {
  final String name;
  final String imgurl;
  ProfileView({this.name, this.imgurl});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 350.0,
            floating: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text(name),
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new CachedNetworkImage(
                    imageUrl: imgurl,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
              new ListTile(
                title: new Text("Mute notifications"),
                trailing: new Switch(
                  value: false,
                  onChanged: null,
                  inactiveThumbColor: Theme.of(context).primaryColor,
                ),
              ),
              new ListTile(title: new Text("Custom notifications")),
              new ListTile(
                title: new Text("Encryption"),
                subtitle: new Text(
                    "Message to this chat and calls sre secured with end-to-end encryption. Tap to verify"),
                trailing: new Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              new Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)),
              new Text(
                "    About and phone number",
                style: new TextStyle(color: Theme.of(context).primaryColor),
              ),
              new ListTile(
                title: new Text("Hey there! I am using WhatsApp"),
                subtitle: new Text("15 may"),
              ),
              new ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text("+91 98765 43210"),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Icon(
                          Icons.message,
                          color: Theme.of(context).primaryColor,
                        ),
                        new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                        new Icon(
                          Icons.call,
                          color: Theme.of(context).primaryColor,
                        ),
                        new Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0)),
                        new Icon(Icons.videocam,
                            color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ],
                ),
              ),
              new Text(
                "    Groups in common",
                style: new TextStyle(color: Theme.of(context).primaryColor),
              ),
              new ListTile(
                leading: new CircleAvatar(
                  backgroundImage: new NetworkImage(imgurl),
                ),
                title: new Text("Group 1"),
                subtitle: new Text("Member1, Member2..."),
              ),
              new ListTile(
                leading: new CircleAvatar(
                  backgroundImage: new NetworkImage(imgurl),
                ),
                title: new Text("Group 2"),
                subtitle: new Text("Member1, Member2..."),
              ),
              new ListTile(
                leading: new CircleAvatar(
                  backgroundImage: new NetworkImage(imgurl),
                ),
                title: new Text("Group 3"),
                subtitle: new Text("Member1, Member2..."),
              ),
              new ListTile(
                leading: new Icon(
                  Icons.block,
                  color: Colors.red,
                ),
                title: new Text(
                  "Block",
                  style: new TextStyle(color: Colors.red),
                ),
              ),
              new ListTile(
                leading: new Icon(
                  Icons.thumb_down,
                  color: Colors.red,
                ),
                title: new Text(
                  "Report spam",
                  style: new TextStyle(color: Colors.red),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
