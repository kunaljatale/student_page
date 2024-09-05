import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_id/models.dart';

import 'package:http/http.dart'as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  List<StudentData> studentdata=[];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Student list"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getdata(),

        builder: (context, snapshot) {

     if(snapshot.hasData){
      
          return ListView.builder(
            itemCount: studentdata.length,
            itemBuilder: (context,index){
              return 
              
               Container(
                margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
                height: 130,
                color: Colors.yellow,
                 child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
                  children: [
                    
                    Text("student id:${studentdata[index].userId} "),
                    Text("student second: ${studentdata[index].id}"),
                    Text("student data: ${studentdata[index].title}"
                    ,maxLines: 1,
                    ),
                    Text("student data: ${studentdata[index].body}",
maxLines: 1,
                    ),
                    
          
          
                    
                  ],
                           ),
               ) ;  
            });

     }else{
   return   Center(child: CircularProgressIndicator());
      
     }


        }
      ),
    );
  }
  
// loadingdata(){
//   Future.delayed(Duration(seconds: 3));
//      getdata();
// }
 Future <List<StudentData>?> getdata()async{
  await Future.delayed(Duration(seconds: 3));
  final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  var data= jsonDecode(response.body.toString());

  if(response.statusCode==200){
    for(Map<String, dynamic> i in data ){
      studentdata.add(StudentData.fromJson(i));
    }
    return studentdata;

  }else{
    return studentdata;

  }



  }


  loadingdadta(){
    Future.delayed(Duration(seconds: 2));

    getdata();
  }


}