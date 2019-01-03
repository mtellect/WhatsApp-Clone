import 'package:flutter/material.dart';

enum StatusViewed {
  mute,
  now,
  seen,
}

class StatusModel {
  String imagePath;
  String senderName;
  String message;
  String date;
  int updateCount;
  StatusViewed status;

  StatusModel(
      {@required this.imagePath,
      @required this.senderName,
      @required this.message,
      @required this.date,
      @required this.status,
      @required this.updateCount});
}

List<StatusModel> statusList = [
  new StatusModel(
      imagePath: "https://bit.ly/2QmEymU",
      senderName: "Fluid Angle",
      message: "So when are we expecting you to resume?",
      date: "Today, 7:49 PM",
      status: StatusViewed.now,
      updateCount: 2),
  new StatusModel(
      imagePath: "https://bit.ly/2RnnK43",
      senderName: "Mercy Ubani",
      message: "lolz....mau mau leave me ooo",
      date: "Today, 7:49 PM",
      status: StatusViewed.mute,
      updateCount: 5),
  new StatusModel(
      imagePath: "https://bit.ly/2F60AbJ",
      senderName: "Irene Ugochi",
      message: "I will",
      date: "Today, 7:49 PM",
      status: StatusViewed.now,
      updateCount: 3),
  new StatusModel(
      imagePath: "https://bit.ly/2AtU4IB",
      senderName: "Little Me",
      message: "New update: https//i.diawi.com/",
      date: "Today, 7:49 PM",
      status: StatusViewed.mute,
      updateCount: 4),
  new StatusModel(
      imagePath: "https://bit.ly/2RwWsIu",
      senderName: "Sammy Uko",
      message: "Afa how much u dey bring?",
      date: "Today, 7:49 PM",
      status: StatusViewed.now,
      updateCount: 2),
  new StatusModel(
      imagePath: "https://bit.ly/2BYFEA5",
      senderName: "Geneieve",
      message: "its so painful we didn't travel oo",
      date: "Today, 7:49 PM",
      status: StatusViewed.seen,
      updateCount: 5),
  new StatusModel(
      imagePath: "https://bit.ly/2GTxtuM",
      senderName: "James Cartel",
      message: "Guy this is just like starting afresh",
      date: "Today, 7:49 PM",
      status: StatusViewed.now,
      updateCount: 1),
  new StatusModel(
      imagePath: "https://bit.ly/2CMvuEh",
      senderName: "Jennifer",
      message: "Thanks dear",
      date: "Today, 7:49 PM",
      status: StatusViewed.seen,
      updateCount: 2),
];
