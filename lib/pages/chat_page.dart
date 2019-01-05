import 'package:flutter/material.dart';
import 'package:whatsapp_clone/logic/chat_model.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';
import 'package:whatsapp_clone/pages/view_image_page.dart';
import 'package:whatsapp_clone/utils/colors.dart';
import 'package:whatsapp_clone/utils/images.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return new ListView.separated(
      itemBuilder: (context, index) {
        return _buildListItem(index);
      },
      itemCount: chatList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 80.0, right: 10.0),
          child: new Divider(
            height: 0.05,
            color: Colors.black.withOpacity(0.4),
          ),
        );
      },
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      child: new ListTile(
        onTap: () => Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => ChatScreen(
                      name: chatList[index].senderName,
                      imgurl: chatList[index].imagePath,
                    ))),
        leading: _buildAvatar(index: index),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(
              chatList[index].senderName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            new Text(
              chatList[index].date,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: _buildMessageStatus(index: index),
        ),
      ),
    );
  }

  Widget _buildMessageStatus({@required int index}) {
    MessageStatus status = chatList[index].status;
    String message = chatList[index].message;

    if (status == MessageStatus.sent) {
      return new Row(
        children: <Widget>[
          new Icon(
            Icons.check,
            size: 16.0,
            color: Colors.grey,
          ),
          new SizedBox(
            width: 5.0,
          ),
          new Flexible(
            child: new Text(
              message,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }
    if (status == MessageStatus.read) {
      return new Row(
        children: <Widget>[
          new Image.asset(
            double_check,
            height: 16.0,
            width: 16.0,
            color: Colors.blue,
          ),
          new SizedBox(
            width: 5.0,
          ),
          new Flexible(
            child: new Text(
              message,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }

    if (status == MessageStatus.seen) {
      return new Row(
        children: <Widget>[
          new Image.asset(
            double_check,
            height: 16.0,
            width: 16.0,
            color: Colors.grey,
          ),
          new SizedBox(
            width: 5.0,
          ),
          new Flexible(
            child: new Text(
              message,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }
    if (status == MessageStatus.failed) {
      return new Row(
        children: <Widget>[
          new Icon(
            Icons.access_time,
            size: 16.0,
            color: Colors.grey,
          ),
          new SizedBox(
            width: 5.0,
          ),
          new Flexible(
            child: new Text(
              message,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildAvatar({int index}) {
    String imagePath = chatList[index].imagePath;
    String profileName = chatList[index].senderName;

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
                      profileName: profileName,
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
                    profileName: profileName,
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
}
