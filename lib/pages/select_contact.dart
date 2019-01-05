import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:whatsapp_clone/logic/contact_model.dart';
import 'package:whatsapp_clone/pages/view_image_page.dart';
import 'package:whatsapp_clone/utils/colors.dart';
import 'package:whatsapp_clone/utils/images.dart';

class SelectContacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SelectContactsState();
}

class _SelectContactsState extends State<SelectContacts> {
  Widget _buildAppBar() {
    return new AppBar(
      title: new Text("Select Contacts"),
      actions: <Widget>[
        new Icon(Icons.search),
        new Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
        new Icon((Icons.more_vert))
      ],
    );
  }

  Widget _buildList() {
    return new ListView.separated(
      itemBuilder: (context, index) {
        return _buildListItem(index);
      },
      itemCount: contactList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 80.0, right: 10.0),
          child: new Divider(
            height: 0.05,
            color: Colors.black.withOpacity(0.0),
          ),
        );
      },
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      child: new ListTile(
        onTap: () {},
        leading: _buildAvatar(index: index),
        title: new Text(
          contactList[index].contactName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: _buildMessageStatus(index: index),
        ),
      ),
    );
  }

  Widget _buildMessageStatus({@required int index}) {
    String status = contactList[index].message;
    return new Row(
      children: <Widget>[
        new Flexible(
          child: new Text(
            status ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar({int index}) {
    String imagePath = contactList[index].imagePath;
    String contactName = contactList[index].contactName;
    ContactType type = contactList[index].type;

    if (imagePath == null && type == ContactType.contact) {
      return new Container(
        height: 60.0,
        width: 50.0,
        child: Center(
          child: Container(
            height: 60.0,
            width: 50.0,
            child: new Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: blue3,
              shape: BoxShape.circle,
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
      );
    }

    if (imagePath == null && type == ContactType.group) {
      return new Container(
        height: 60.0,
        width: 50.0,
        child: Center(
          child: Container(
            height: 60.0,
            width: 50.0,
            child: new Icon(
              Icons.group,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: blue3,
              shape: BoxShape.circle,
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
      );
    }

    if (imagePath == null || imagePath.isEmpty) {
      return new Hero(
        tag: "imageHero$index",
        child: new GestureDetector(
          onTap: () {
            Navigator.of(context).push(new PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return new ViewImagePage(
                      imagePath: person_image,
                      profileName: contactName,
                      index: index);
                }));
          },
          child: Container(
            height: 60.0,
            width: 50.0,
            child: Center(
              child: Container(
                height: 60.0,
                width: 50.0,
                child: Image.asset(
                  person_image,
                  color: Colors.white,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                  color: blue3,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    return new Hero(
      tag: "imageHero$index",
      child: new GestureDetector(
        onTap: () {
          Navigator.of(context).push(new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return new ViewImagePage(
                    imagePath: imagePath,
                    profileName: contactName,
                    index: index);
              }));
        },
        child: Container(
          height: 50.0,
          width: 50.0,
          child: Center(
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(imagePath),
                      fit: BoxFit.cover)),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: _buildList());
  }
}
