import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/model/chat_model.dart';
import 'package:untitled/provider/chat_provider.dart';

class AllChatsPage extends StatefulWidget {
  const AllChatsPage({Key? key}) : super(key: key);
  @override
  State<AllChatsPage> createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {


  @override
  void initState()
  {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ChatProvider>(context,listen: false).getChats();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text("Chats Message"),
            ),
            Expanded(
              child:Consumer<ChatProvider>(
                  builder: (context,value,child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: value.userChats.length,
                      itemBuilder: (context,index)
                      {
                        return userCard(value.userChats[index],size);
                      },
                    );
                  }
              ),

            )
          ],
        ),
      ),
    );
  }

  Widget userCard(ChatModel chatModel,Size size)
  {
    return Container(
      width: size.width*0.9,
      height: size.height*0.2,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("SENDER : ${chatModel.sendUser}",style: const TextStyle(color: Colors.black)),
          Text("RECEIVER : ${chatModel.receiveUser}",style: const TextStyle(color: Colors.black)),
          Text("MESSAGE: ${chatModel.message}",style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
