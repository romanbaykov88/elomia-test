import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/widgets/chat/message.dart';
import 'package:mobile/widgets/chat/reaction.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class ChatHistory {
  final List<ChatMessage> messages;

  const ChatHistory(this.messages);
}

class ChatMessage {
  final String author;
  final String text;
  final String? reaction;

  // final Reaction reaction;
  const ChatMessage({required this.author, required this.text, this.reaction});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      author: json['author'],
      text: json['text'],
      reaction: json['reaction'],
    );
  }
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<List<ChatMessage>> chatMessages;

  Future<List<ChatMessage>> fetchChatMessages() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/ff058ceb-198b-448e-9407-462170feb00c'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['chatHistory'] as List)
          .map((jsonChatMessage) => ChatMessage.fromJson(jsonChatMessage))
          .toList();
      // return Album.fromJson(jsonDecode(response.body).chatHistory);
    } else {
      throw Exception('Failed to load chat history');
    }
  }

  @override
  void initState() {
    super.initState();
    chatMessages = fetchChatMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.3, 1],
          colors: [
            Color(0xff2192F0),
            Color(0xff040E29),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/secondary_btn.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Elomia',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              'will reply in 30 sec',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FutureBuilder<List<ChatMessage>>(
                  future: chatMessages,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ChatMessage>> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = snapshot.data?.map((message) {
                        bool isBot = message.author == 'bot';
                        List<Widget> rowWidgets = [
                          Message(
                            messageText: (message).text,
                            color: isBot ? Colors.white : const Color(0xffAC6EF6),
                            textColor: isBot ? Colors.black : Colors.white,
                            tailDirection:
                                isBot ? TailDirection.left : TailDirection.right,
                          ),
                        ];
                        if (isBot) {
                          rowWidgets.add(Reaction(
                            reaction: message.reaction,
                          ));
                        }
                        return Row(
                          mainAxisAlignment: isBot
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: rowWidgets,
                        );
                      }).toList() as List<Widget>;
                      ChatMessage? first = snapshot.data?.first;
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        )
                      ];
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting result...'),
                        )
                      ];
                    }

                    return Center(
                      child: ListView(
                        children: children,
                      ),
                    );
                  }),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xfff4f3f3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 17.0,
                            height: 2.0,
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          suffixIcon: Icon(
                            Icons.send,
                            color: Color(0xff8e8e93),
                            size: 21,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 83,
                decoration: const BoxDecoration(
                  color: Color(0xfff4f3f3),
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.grid_view,
                            color: Color(0xff2e2f34),
                          ),
                          onPressed: () {},
                        ),
                        const Text('Exercises',
                          style: TextStyle(
                            color: Color(0xff2e2f34),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.insights,
                            color: Color(0xff2e2f34),
                          ),
                          onPressed: () {},
                        ),
                        const Text('Insights',
                          style: TextStyle(
                            color: Color(0xff2e2f34),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.insert_comment,
                            color: Color(0xff2e2f34),
                          ),
                          onPressed: () {},
                        ),
                        const Text('Chat',
                          style: TextStyle(
                            color: Color(0xff2e2f34),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.settings,
                            color: Color(0xff2e2f34),
                          ),
                          onPressed: () {},
                        ),
                        const Text('Settings',
                          style: TextStyle(
                            color: Color(0xff2e2f34),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
