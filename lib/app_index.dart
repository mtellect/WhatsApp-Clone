import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/calls_page.dart';
import 'package:whatsapp_clone/pages/camera_page.dart';
import 'package:whatsapp_clone/pages/chat_page.dart';
import 'package:whatsapp_clone/pages/select_contact.dart';
import 'package:whatsapp_clone/pages/status_page.dart';
import 'package:whatsapp_clone/utils/colors.dart';

class AppIndex extends StatefulWidget {
  @override
  _AppIndexState createState() => _AppIndexState();
}

class _AppIndexState extends State<AppIndex> {
  PageController _pageController = PageController(initialPage: 1);
  int _currentPage = 1;

  //init all the app pages
  List<Widget> _appPages = [
    CameraPage(),
    ChatPage(),
    StatusPage(),
    CallsPage(),
  ];

  //listen for page change and update
  void _onPageChange(int val) {
    setState(() {
      _currentPage = val;
    });
  }

  //build app Pages
  Widget _buildPagesLayout() {
    return new PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChange,
        itemCount: _appPages.length,
        itemBuilder: (context, index) {
          return _appPages[index];
        });
  }

  //build WhatsApp appBar
  Widget _buildAppBar() {
    return new AppBar(
      title: new Text("WhatsApp Clone"),
      actions: <Widget>[
        new IconButton(icon: Icon(Icons.search), onPressed: () {}),
        _buildPopUp()
      ],
      bottom: _buildAppTabs(),
    );
  }

  Widget _buildPopUp() {
    return new PopupMenuButton(
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              const PopupMenuItem(value: "Newgroup", child: Text("New group")),
              PopupMenuItem(
                value: "New broadcast",
                child: Text("New broadcast"),
              ),
              PopupMenuItem(
                value: "WhatsApp web",
                child: Text("WhatsApp web"),
              ),
              PopupMenuItem(
                value: "Starred messages",
                child: Text("Starred message"),
              ),
              PopupMenuItem(
                value: "Setting",
                child: Text("Setting"),
              )
            ]);
  }

  //build WhatsApp tabs
  Widget _buildAppTabs() {
    return new PreferredSize(
        child: new Container(
          height: 50.0,
          padding: EdgeInsets.all(5),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildTabs(flex: 1, position: 0, title: null),
              _buildTabs(flex: 2, position: 1, title: "CHATS"),
              _buildTabs(flex: 2, position: 2, title: "STATUS"),
              _buildTabs(flex: 2, position: 3, title: "CALLS"),
            ],
          ),
        ),
        preferredSize: new Size.fromHeight(50.0));
  }

  //build tab items
  Widget _buildTabs(
      {@required int flex, @required int position, @required String title}) {
    bool selected = _currentPage == position;
    if (position == 0) {
      return new Flexible(
          flex: flex,
          child: new GestureDetector(
            onTap: () {
              _pageController.jumpToPage(position);
            },
            child: new Container(
              height: 50.0,
              child: Center(
                child: new Icon(
                  Icons.camera_alt,
                  size: 18.0,
                  color: selected == true
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
              ),
              decoration: BoxDecoration(
                  color:
                      selected == true ? Colors.black.withOpacity(0.5) : null,
                  borderRadius: BorderRadius.circular(12.0)),
            ),
          ));
    }
    return new Flexible(
        flex: flex,
        child: new GestureDetector(
          onTap: () {
            _pageController.jumpToPage(position);
          },
          child: new Container(
            height: 50.0,
            child: Center(
              child: new Text(
                title,
                style: TextStyle(
                  color: selected == true
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: selected == true ? Colors.black.withOpacity(0.5) : null,
                borderRadius: BorderRadius.circular(12.0)),
          ),
        ));
  }

  Widget _buildChatFloatingButton() {
    return new FloatingActionButton(
      onPressed: () => Navigator.push(context,
          new MaterialPageRoute(builder: (context) => SelectContacts())),
      child: Icon(Icons.message),
    );
  }

  Widget _buildCallFloatingButton() {
    return new FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add_call),
    );
  }

  Widget _buildWriteStatus() {
    return new FloatingActionButton(
      onPressed: () {},
      mini: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.edit,
          color: Colors.grey,
        ),
      ),
      backgroundColor: Colors.white,
      shape: CircleBorder(),
      elevation: 8.0,
    );
  }

  Widget _buildImageStatus() {
    return new FloatingActionButton(
      heroTag: "imageStatus",
      onPressed: () {},
      child: Icon(
        Icons.camera_alt,
        color: Colors.white,
      ),
      backgroundColor: blue6,
      elevation: 8.0,
    );
  }

  Widget _buildStatusFloatingButtons() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _buildWriteStatus(),
        new SizedBox(
          height: 10.0,
        ),
        _buildImageStatus()
      ],
    );
  }

  Widget _buildFloatingButtons() {
    if (_currentPage == 1) {
      return _buildChatFloatingButton();
    }
    if (_currentPage == 2) {
      return _buildStatusFloatingButtons();
    }
    if (_currentPage == 3) {
      return _buildCallFloatingButton();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPagesLayout(),
      floatingActionButton: _buildFloatingButtons(),
    );
  }
}
