import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/pages/chat_page.dart';
import 'package:provider/provider.dart';

class AllMessagePage extends StatelessWidget {
  AllMessagePage({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back, color: Colors.yellow,),
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: _buildUserList(context),
    );
  }

  Widget _buildUserList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(context, doc))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(BuildContext context, DocumentSnapshot doc) {
    final Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;

    if (auth.currentUser != null && data.containsKey('email')) {
      if (auth.currentUser!.email != data['email']) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          title: Text(data['email'].substring(0, 5)),
          subtitle: Text(
            'Tap to chat',
            style: TextStyle(color: Colors.black),
          ),
          trailing: Icon(Icons.more_vert),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: doc.id,
              ),
            ));
          },
        );
      }
    }

    // Return an empty container if the conditions are not met
    return Container();
  }
}
