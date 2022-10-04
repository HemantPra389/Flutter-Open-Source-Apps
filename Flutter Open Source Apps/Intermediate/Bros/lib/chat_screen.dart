import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bros/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String message;
  late User loggedIn;

  @override
  void initState() {
    getuser();
    super.initState();
  }

  void getuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedIn = user;
        print(loggedIn.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   final message = await _firestore.collection('messages').get();
  //   final allData = message.docs.map((doc) => doc.data()).toList();
  //
  //   print(allData);
  // }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text(
          'The Code Chamber',
          style: TextStyle(fontFamily: 'Lobster'),
        ),
        backgroundColor: Color(0xFF960fbd),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('messages')
                    .orderBy('time', descending: false)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data.docs.reversed;
                    List<MessageBox> messageWidgets = [];
                    for (var message in messages!) {
                      final messageText = message['text'];
                      final messageSender = message['sender'];
                      final messageTime = message['time'] as Timestamp;
                      final currentUser = loggedIn.email;

                      final messageWidget = MessageBox(
                          messageText,
                          messageSender,
                          currentUser == messageSender,
                          messageTime);
                      messageWidgets.add(messageWidget);
                    }

                    return Expanded(
                      child: ListView(
                        reverse: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        children: messageWidgets,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      //Implement send functionality.
                      _firestore.collection('messages').add({
                        'text': message,
                        'sender': loggedIn.email,
                        'time': DateTime.now()
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  MessageBox(this.newmessage, this.sender, this.isMe, this.time);
  final newmessage;
  final sender;
  final bool isMe;
  final time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$sender ',
            style: TextStyle(
                fontSize: 12.0, color: isMe ? Colors.white : Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          // Text(
          //   '$sender ',
          //   style: TextStyle(fontSize: 12.0, color: Colors.black54),
          // ),
          Material(
            elevation: 5.00,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.00),
                    bottomRight: Radius.circular(30.00),
                    bottomLeft: Radius.circular(30.00))
                : BorderRadius.only(
                    topRight: Radius.circular(30.00),
                    bottomRight: Radius.circular(30.00),
                    bottomLeft: Radius.circular(30.00)),
            color: isMe ? Color(0xFF960fbd) : Color(0xFF252525),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    '$newmessage',
                    style: TextStyle(
                        color: isMe ? Colors.white : Colors.white,
                        fontSize: 15.00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${DateTime.fromMillisecondsSinceEpoch(time.seconds * 1000)}',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: isMe ? Colors.white70 : Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
