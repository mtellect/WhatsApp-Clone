import 'package:flutter/material.dart';

enum MessageStatus {
  none,
  sent,
  failed,
  read,
  seen,
}

class ChatModel {
  String imagePath;
  String senderName;
  String message;
  String date;
  MessageStatus status;

  ChatModel(
      {@required this.imagePath,
      @required this.senderName,
      @required this.message,
      @required this.date,
      @required this.status});
}

List<ChatModel> chatList = [
  new ChatModel(
      imagePath: "https://bit.ly/2QmEymU",
      senderName: "Fluid Angle",
      message: "So when are we expecting you to resume?",
      date: "03/01/19",
      status: MessageStatus.read),
  new ChatModel(
      imagePath: "https://bit.ly/2RnnK43",
      senderName: "Mercy Ubani",
      message: "lolz....mau mau leave me ooo",
      date: "01/01/19",
      status: MessageStatus.read),
  new ChatModel(
      imagePath: "https://bit.ly/2F60AbJ",
      senderName: "Irene Ugochi",
      message: "I will",
      date: "02/01/19",
      status: MessageStatus.read),
  new ChatModel(
      imagePath: null,
      senderName: "Sew4me team members",
      message: "New update: https//i.diawi.com/",
      date: "03/01/19",
      status: MessageStatus.sent),
  new ChatModel(
      imagePath: "https://bit.ly/2RwWsIu",
      senderName: "Sammy Uko",
      message: "Afa how much u dey bring?",
      date: "03/01/19",
      status: MessageStatus.sent),
  new ChatModel(
      imagePath: "https://bit.ly/2BYFEA5",
      senderName: "Geneieve",
      message: "its so painful we didn't travel oo",
      date: "02/01/19",
      status: MessageStatus.seen),
  new ChatModel(
      imagePath: "https://bit.ly/2GTxtuM",
      senderName: "James Cartel",
      message: "Guy this is just like starting afresh",
      date: "02/01/19",
      status: MessageStatus.failed),
  new ChatModel(
      imagePath: "https://bit.ly/2CMvuEh",
      senderName: "Jennifer",
      message: "Thanks dear",
      date: "01/01/19",
      status: MessageStatus.seen),
  new ChatModel(
      imagePath: "https://bit.ly/2LQObtn",
      senderName: "Miracle Uka",
      message: "Na her name na....",
      date: "01/01/19",
      status: MessageStatus.read),
  new ChatModel(
      imagePath: "https://bit.ly/2BVJryg",
      senderName: "Little Me",
      message: "My love",
      date: "01/01/19",
      status: MessageStatus.failed),
  new ChatModel(
      imagePath: "https://bit.ly/2F7YyI3",
      senderName: "Johnny",
      message: "Bro you don check ravepay??",
      date: "01/01/19",
      status: MessageStatus.sent),
];
