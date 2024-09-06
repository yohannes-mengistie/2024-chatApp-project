import 'package:chat_app/component/user_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_services.dart';
import 'package:chat_app/component/my_drawer.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home page'),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder(stream: _chatService.getUsersStream(), builder: (context,snapshot){
      if(snapshot.hasError){
        return const Text('error');
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Text('Loading...');
      }

      return ListView(
        children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context)).toList(),
      );
    });
  }
  
Widget _buildUserListItem (
  Map<String,dynamic> userData,BuildContext context){
    if(userData['email'] != _authServices.getCurrentUser()!.email){
      return UserTile(
      text:userData['email'],
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ChatPage(
          receiverEmail: userData['email'],
          receiverID: userData['uid'],
        ),));
      },
    );
    }else{
      return Container();
    }
}
}