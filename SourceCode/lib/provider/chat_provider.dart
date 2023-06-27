import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/chat_model.dart';
import '../model/user_model.dart';

class ChatProvider extends ChangeNotifier{
  List<UserModel> userList = [];


  Future<void> getUsers() async
  {
    var val =  await FirebaseFirestore.instance.collection('users').get();

    List<UserModel> customModels = val.docs.map((doc) {
      return UserModel.fromJson(doc.data());
    }).toList();


    userList = customModels;

    notifyListeners();

  }

  Future<void> sendChat(String name,UserModel userModel,String message) async
  {

    var data = ChatModel(sendUser: name, receiveUser: userModel.userName, message: message, id: message+userModel.userId);


    FirebaseFirestore.instance.collection('users')
        .doc(userModel.userId)
        .collection("ChatMessage")
        .doc(data.id)
        .set(data.toJson());
  }

  List<ChatModel> userChats = [];

  String userID = "sQ4Md0aLeXKyYlv6B4I2";
  Future<void> getChats() async
  {
    var val=  await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection("ChatMessage")
        .get();

    List<ChatModel> customModels = val.docs.map((doc) {
      return ChatModel.fromJson(doc.data());
    }).toList();




    userChats = customModels;
    notifyListeners();
  }

}