import 'package:flutter/material.dart';
import 'package:flutterjuly23/routes/route.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var agument = ModalRoute.of(context)!.settings.arguments as UArgument;
   

    return Scaffold(
      appBar: AppBar(
        title: Text(agument.title,style: TextStyle(color: Color.fromARGB(255, 24, 59, 61),fontFamily: 'fonst'),)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(agument.url),
            fit: BoxFit.cover,
          ),
        ),child: Padding(
          padding : EdgeInsets.all(20),
          child: Text(agument.subtitle, style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 24, 59, 61) , fontFamily: 'fonst'),),
         
        )
      ),
    );
  }
}
