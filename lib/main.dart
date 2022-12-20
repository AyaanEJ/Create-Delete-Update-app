import 'package:flutter/material.dart';

void main() {
  //const name = 'Ayaan';
  //print(name);
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> cats = ['Felix', 'Fluffy', 'Lucky', 'Smudge', 'Lady', 'Angel'];
  final textController = TextEditingController();
  int? catIndex;
  IconData buttonIcon = Icons.add;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
                child: TextField(
              controller: textController,
            )),
            ElevatedButton(
              child: Icon(buttonIcon),
              onPressed: () {
                setState(() {
                  if (catIndex != null) {
                    cats[catIndex!] = textController.text;
                    catIndex = null;
                    buttonIcon = Icons.add;
                  } else {
                    cats.add(textController.text);
                  }
                  textController.clear();
                });
                print(cats);
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(cats[index]),
              onTap: () {
                catIndex = index;
                setState(() {
                  textController.text = cats[index];
                  buttonIcon = Icons.save;
                });
              },
              onLongPress: () {
                setState(
                  () {
                    cats.removeAt(index);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
