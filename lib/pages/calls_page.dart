import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/logic/call_model.dart';
import 'package:whatsapp_clone/pages/view_image_page.dart';
import 'package:whatsapp_clone/utils/colors.dart';
import 'package:whatsapp_clone/utils/images.dart';

class CallsPage extends StatefulWidget {
  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
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
      itemCount: callList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 80.0, right: 10.0),
          child: new Divider(
            height: 0.05,
            color: Colors.black.withOpacity(0.2),
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
          callList[index].callerName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: _buildMessageStatus(index: index),
        ),
        trailing: _buildCallType(index: index),
      ),
    );
  }

  Widget _buildMessageStatus({@required int index}) {
    CallStatus status = callList[index].status;

    if (status == CallStatus.missedCall) {
      return new Row(
        children: <Widget>[
          new Image.asset(
            missed_call,
            height: 16.0,
            width: 16.0,
            color: Colors.red,
          ),
          new SizedBox(
            width: 5.0,
          ),
          new Text(
            callList[index].date,
            style: TextStyle(fontSize: 10),
          ),
        ],
      );
    }
    if (status == CallStatus.receivedCall) {
      return new Row(
        children: <Widget>[
          new Image.asset(
            incoming_call,
            height: 16.0,
            width: 16.0,
            color: Colors.red,
          ),
          new SizedBox(
            width: 5.0,
          ),
          new Text(
            callList[index].date,
            style: TextStyle(fontSize: 10),
          ),
        ],
      );
    }

    if (status == CallStatus.outgoingCall) {
      return new Row(
        children: <Widget>[
          new Image.asset(
            outgoing_call,
            height: 16.0,
            width: 16.0,
            color: Colors.green,
          ),
          new SizedBox(
            width: 5.0,
          ),
          new Text(
            callList[index].date,
            style: TextStyle(fontSize: 10),
          ),
        ],
      );
    }
  }

  Widget _buildAvatar({int index}) {
    String imagePath = callList[index].imagePath;
    String profileName = callList[index].callerName;

    if (imagePath == null || imagePath.isEmpty) {
      return new CircleAvatar(
        maxRadius: 25,
        child: Image.asset(
          person_image,
          fit: BoxFit.cover,
          color: Colors.white,
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.grey,
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

  Widget _buildCallType({int index}) {
    CallType callType = callList[index].type;
    if (callType == CallType.videoCall) {
      return new IconButton(
          icon: Icon(
            Icons.video_call,
            color: blue3,
            size: 30.0,
          ),
          onPressed: () {});
    }
    if (callType == CallType.voiceCall) {
      return new IconButton(
          icon: Icon(
            Icons.call,
            color: blue3,
            size: 30.0,
          ),
          onPressed: () {});
    }
  }
}
