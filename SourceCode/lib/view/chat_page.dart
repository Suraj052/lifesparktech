import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/chat_provider.dart';

class ChatPage extends StatefulWidget {

  final UserModel userModel;
  const ChatPage({Key? key,required this.userModel}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    const userID = "Ram";

    final provider = Provider.of<ChatProvider>(context);

    TextEditingController chatController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Sending to ${widget.userModel.userName}"),
              ),
              Center(
                child: Container(
                  width: size.width*0.9,
                  child: TextField(
                    maxLength: 140,
                    decoration: InputDecoration(
                      labelText: 'Type Message',
                      labelStyle: const TextStyle(fontSize:14,color: Colors.blueAccent,fontFamily: 'Poppins',fontWeight: FontWeight.w600),
                      alignLabelWithHint: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:  const BorderSide(width: 1, color: Color(0xFF6F6F6F)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:  const BorderSide(width: 1, color:Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                  onPressed: (){
                    provider.sendChat(userID, widget.userModel, chatController.text.toString());
                  },
                  child: const Icon(
                    Icons.send
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showToast(String s)=>Fluttertoast.showToast(
  msg: s,
  fontSize: 15.0,
  backgroundColor: Color(0xFF091945),
  textColor: Colors.white,
  gravity: ToastGravity.TOP_LEFT,
);

