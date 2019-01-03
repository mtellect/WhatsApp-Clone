import 'package:flutter/material.dart';

enum CallType { videoCall, voiceCall }

enum CallStatus {
  receivedCall,
  outgoingCall,
  missedCall,
}

class CallModel {
  String imagePath;
  String callerName;
  String message;
  String date;
  CallStatus status;
  CallType type;

  CallModel(
      {@required this.imagePath,
      @required this.callerName,
      @required this.message,
      @required this.date,
      @required this.status,
      @required this.type});
}

List<CallModel> callList = [
  new CallModel(
      imagePath: "https://bit.ly/2QmEymU",
      callerName: "Fluid Angle",
      message: "So when are we expecting you to resume?",
      date: "03/01/19",
      type: CallType.videoCall,
      status: CallStatus.missedCall),
  new CallModel(
      imagePath: "https://bit.ly/2RnnK43",
      callerName: "Mercy Ubani",
      message: "lolz....mau mau leave me ooo",
      date: "01/01/19",
      type: CallType.voiceCall,
      status: CallStatus.receivedCall),
  new CallModel(
      imagePath: "https://bit.ly/2F60AbJ",
      callerName: "Irene Ugochi",
      message: "I will",
      date: "02/01/19",
      type: CallType.videoCall,
      status: CallStatus.receivedCall),
  new CallModel(
      imagePath: null,
      callerName: "Sew4me team members",
      message: "New update: https//i.diawi.com/",
      date: "03/01/19",
      type: CallType.voiceCall,
      status: CallStatus.missedCall),
  new CallModel(
      imagePath: "https://bit.ly/2RwWsIu",
      callerName: "Sammy Uko",
      message: "Afa how much u dey bring?",
      date: "03/01/19",
      type: CallType.videoCall,
      status: CallStatus.outgoingCall),
  new CallModel(
      imagePath: "https://bit.ly/2BYFEA5",
      callerName: "Geneieve",
      message: "its so painful we didn't travel oo",
      date: "02/01/19",
      type: CallType.voiceCall,
      status: CallStatus.outgoingCall),
  new CallModel(
      imagePath: "https://bit.ly/2GTxtuM",
      callerName: "James Cartel",
      message: "Guy this is just like starting afresh",
      date: "02/01/19",
      type: CallType.videoCall,
      status: CallStatus.receivedCall),
  new CallModel(
      imagePath: "https://bit.ly/2CMvuEh",
      callerName: "Jennifer",
      message: "Thanks dear",
      date: "01/01/19",
      type: CallType.videoCall,
      status: CallStatus.missedCall),
  new CallModel(
      imagePath: "https://bit.ly/2LQObtn",
      callerName: "Miracle Uka",
      message: "Na her name na....",
      date: "01/01/19",
      type: CallType.videoCall,
      status: CallStatus.missedCall),
  new CallModel(
      imagePath: "https://bit.ly/2BVJryg",
      callerName: "Little Me",
      message: "My love",
      date: "01/01/19",
      type: CallType.videoCall,
      status: CallStatus.missedCall),
  new CallModel(
      imagePath: "https://bit.ly/2F7YyI3",
      callerName: "Johnny",
      message: "Bro you don check ravepay??",
      date: "01/01/19",
      type: CallType.videoCall,
      status: CallStatus.missedCall),
];
