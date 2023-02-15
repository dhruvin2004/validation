import 'dart:io';

import 'package:exam/global.dart';
import 'package:exam/modal/userdata.dart';
import 'package:flutter/material.dart';

import '../modal/registermodal.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService httpService = HttpService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpService.getRegisterData();
   httpService.getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
      ),
      body:  ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text("Id : ${AppString.data[0]['id']}",style: AppString.titlemediam ),
          Text("Token : ${AppString.data[0]['token']}",style: AppString.titlemediam),
          SizedBox(height: 10,),
          FutureBuilder<List<UserData>>(
            future: httpService.getUserData(),
            builder: (context, snapshot) {
              List<UserData> data = snapshot.data!;
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Container(
                     height: 750,
                     child: ListView.builder(

                      itemBuilder: (context,index){
                        return  Container(
                          height: 200,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ID : ${data[index].id.toString()}",style: AppString.titlemediam,),
                              Text("Body :${data[index].body.toString()}",style: AppString.titlemediam,),
                              Text("User ID : ${data[index].userId.toString()}",style: AppString.titlemediam,),
                              Text("Title : ${data[index].title.toString()}",style: AppString.titlemediam,),
                            ],
                          ),
                        );
                },itemCount: data.length,),
                   ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
