import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsapp_clone/utils/colors.dart';

class ViewImagePage extends StatelessWidget {
  final String profileName;
  final String imagePath;
  final int index;

  const ViewImagePage({Key key, this.profileName, this.imagePath, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: new Material(
        color: Colors.black38,
        child: Hero(
            tag: 'imageHero$index',
            child: new Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                //height: 300.0,
                margin: EdgeInsets.only(left: 40.0, right: 40.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Flexible(
                      child: new Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          new Container(
                            height: 300,
                            color: blue3.withOpacity(0.2),
                            child: Center(
                              child: CachedNetworkImage(
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                imageUrl: imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          new Container(
                            height: 50.0,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(5),
                            color: Colors.black.withOpacity(0.4),
                            child: new Text(
                              profileName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Divider(
                      color: Colors.black.withOpacity(0.4),
                      height: 0.05,
                    ),
                    _buildButtons()
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: EdgeInsets.all(5.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new IconButton(
                icon: Icon(
                  Icons.message,
                  color: blue3,
                ),
                onPressed: () {}),
          ),
          new Flexible(
            child: new IconButton(
                icon: Icon(
                  Icons.call,
                  color: blue3,
                ),
                onPressed: () {}),
          ),
          new Flexible(
            child: new IconButton(
                icon: Icon(
                  Icons.videocam,
                  color: blue3,
                ),
                onPressed: () {}),
          ),
          new Flexible(
            child: new IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: blue3,
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
