import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterjuly23/routes/route.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Computer Knowledge",
            style: TextStyle(fontFamily: 'fonst',color: Color.fromARGB(255, 24, 59, 61)),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
                builder: ((context, snapshot) {
                  var data = json.decode(snapshot.data.toString());
                  return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/detail',
                                  arguments: UArgument(
                                      data[index]['title'],
                                      data[index]['subtitle'],
                                      data[index]['url']));
                            },
                            child: MyBox(data[index]['title'],
                                data[index]['subtitle'], data[index]['url']));
                      },
                      itemCount: data.length);
                }),
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data.json'))));
  }

  Widget MyBox(String title, String subtitle, String url) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 24, 59, 61),
                fontWeight: FontWeight.bold,
                fontFamily: 'fonst'),
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 24, 59, 61), fontFamily: 'fonst'),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
// 