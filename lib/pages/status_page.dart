import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/logic/status_model.dart';
import 'package:whatsapp_clone/utils/colors.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverList(delegate: SliverChildListDelegate([_buildMyStatus()])),
        new SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return _buildItem(index: index);
        }, childCount: statusList.length))
      ],
    );
  }

  Widget _buildMyStatus() {
    return new Column(
      children: <Widget>[
        new ListTile(
          leading: _buildMyStatusAvatar(),
          title: new Text(
            "My Status",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: new Text("Tap to add status update"),
          trailing:
              new IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ),
        new Container(
          color: Colors.black.withAlpha(10),
          padding: EdgeInsets.only(left: 25.0, top: 5.0, bottom: 5.0),
          alignment: Alignment.centerLeft,
          child: new Text(
            "Status updates",
            style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  _buildMyStatusAvatar() {
    return new Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        new CircleAvatar(
          maxRadius: 25,
          backgroundImage:
              new CachedNetworkImageProvider("https://bit.ly/2AtU4IB"),
        ),
        new Container(
          height: 22.0,
          width: 22.0,
          child: Center(
            child: new Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        )
      ],
    );
  }

  _buildStatusAvatar({int index}) {
    String imagePath = statusList[index].imagePath;

    return new Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        new CircleAvatar(
          maxRadius: 25,
          backgroundImage: CachedNetworkImageProvider(imagePath),
        ),
        _buildViewedStatus(index: index)
      ],
    );
  }

  Widget _buildItem({int index}) {
    String statusName = statusList[index].senderName;
    String statusTime = statusList[index].date;

    return Column(
      children: <Widget>[
        new ListTile(
          leading: _buildStatusAvatar(index: index),
          title: new Text(
            statusName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: new Text(
              statusTime,
              style: TextStyle(),
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 80.0, right: 10.0),
          child: new Divider(
            height: 0.05,
            color: Colors.black.withOpacity(0.4),
          ),
        )
      ],
    );
  }

  Widget _buildViewedStatus({int index}) {
    StatusViewed statusViewed = statusList[index].status;
    int updateCount = statusList[index].updateCount;

    if (statusViewed == StatusViewed.now) {
      return new Container(
        height: 22.0,
        width: 22.0,
        child: Center(
          child: new Text(
            "$updateCount",
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
      );
    }

    if (statusViewed == StatusViewed.seen) {
      return new Container(
        height: 22.0,
        width: 22.0,
        child: Center(
          child: new Text(
            "$updateCount",
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      );
    }

    if (statusViewed == StatusViewed.mute) {
      return new Container(
        height: 22.0,
        width: 22.0,
        child: Center(
          child: new Icon(
            Icons.volume_mute,
            color: Colors.white,
            size: 20,
          ),
        ),
        decoration: BoxDecoration(shape: BoxShape.circle, color: blue3),
      );
    }
  }
}
