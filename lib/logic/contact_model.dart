import 'package:flutter/material.dart';

enum ContactType {
  none,
  group,
  contact,
}

class ContactModel {
  String imagePath;
  String contactName;
  String message;
  String date;
  ContactType type;

  ContactModel(
      {@required this.imagePath,
      @required this.contactName,
      @required this.message,
      @required this.date,
      @required this.type});
}

List<ContactModel> contactList = [
  new ContactModel(
      imagePath: null,
      contactName: "New Contact",
      message: null,
      type: ContactType.contact,
      date: null),
  new ContactModel(
      imagePath: null,
      contactName: "New Group",
      message: null,
      type: ContactType.group,
      date: null),
  new ContactModel(
      imagePath: "https://bit.ly/2QmEymU",
      contactName: "Fluid Angle",
      message: "So when are we expecting you to resume?",
      date: "03/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2RnnK43",
      contactName: "Mercy Ubani",
      message: "lolz....mau mau leave me ooo",
      date: "01/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2F60AbJ",
      contactName: "Irene Ugochi",
      message: "I will",
      date: "02/01/19",
      type: null),
  new ContactModel(
      imagePath: null,
      contactName: "Sew4me team members",
      message: "New update: https//i.diawi.com/",
      date: "03/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2RwWsIu",
      contactName: "Sammy Uko",
      message: "Afa how much u dey bring?",
      date: "03/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2BYFEA5",
      contactName: "Geneieve",
      message: "its so painful we didn't travel oo",
      date: "02/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2GTxtuM",
      contactName: "James Cartel",
      message: "Guy this is just like starting afresh",
      date: "02/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2CMvuEh",
      contactName: "Jennifer",
      message: "Thanks dear",
      date: "01/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2LQObtn",
      contactName: "Miracle Uka",
      message: "Na her name na....",
      date: "01/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2BVJryg",
      contactName: "Little Me",
      message: "My love",
      date: "01/01/19",
      type: null),
  new ContactModel(
      imagePath: "https://bit.ly/2F7YyI3",
      contactName: "Johnny",
      message: "Bro you don check ravepay??",
      date: "01/01/19",
      type: null),
];
