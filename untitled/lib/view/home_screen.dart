import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/model/user_model.dart';
import 'package:untitled/provider/chat_provider.dart';
import 'package:untitled/view/all_chats.dart';

import 'chat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  void initState()
  {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ChatProvider>(context,listen: false).getUsers();
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    final provider = Provider.of<ChatProvider>(context,listen: false);
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text("Logged in as RAM"),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text("Can send message Sita "),
            ),
            Expanded(
                child:Consumer<ChatProvider>(
                  builder: (context,value,child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: value.userList.length,
                      itemBuilder: (context,index)
                      {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(userModel: value.userList[index])));
                          },
                            child: userCard(value.userList[index],size));
                      },
                    );
                  }
                ),

            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AllChatsPage()));
                  },
                  child: const Text("Click here to see Sita's Recieved messgage")

              ),
            )

          ],
        ),
      ),
    );
  }

  Widget userCard(UserModel userModel,Size size)
  {
    return Container(
      width: size.width*0.8,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black12,
            borderRadius: BorderRadius.circular(5)
      ),
      child: Text(userModel.userName,style: const TextStyle(color: Colors.blue)),
    );
  }
}
