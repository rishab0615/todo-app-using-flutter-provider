import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rivaanravat/allprovider/home_provider.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.event_note,color: Colors.white,),
        title: Text(
          "Simple todo tracker  ( Todo-app )",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: false,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) => Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 20,right: 20, bottom: 15,top:50),
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: provider.controller,
                        decoration: InputDecoration(
                            hintText: "Enter a to-do....",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.green),
                          onPressed: () {
                            provider.sumbit(context);
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ))
                    ],
                  )),
              provider.todo.length == 0
                  ? Expanded(
                    child: Center(
                        child: Text("No to-dos added..!!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.black54),),
                      ),
                  )
                  : Expanded(
                      child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        itemCount: provider.todo.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                      color: Colors.white
                                      ,border: Border.all(color: Colors.green)
                                  ),
                                  // radius: 15,
                                  child: Center(child: Text((index+1).toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                                ),
                                contentPadding: EdgeInsets.all(7),
                                title: Text(
                                  provider.todo[index],
                                  style: TextStyle(
                                    decoration: provider.completed[index]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    decorationColor: Colors.green,
                                    decorationThickness:
                                        2, // Thinner strike-through line for better appearance
                                  ),
                                ),
                                tileColor: Colors.green.shade50,
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            provider.todocompleted(index,
                                                context); // Pass the index to mark this task as completed
                                          },
                                          icon: Icon(Icons.check)),
                                      IconButton(
                                          onPressed: () {
                                            provider.todoDelete(index,
                                                context); // Pass the index to delete this specific task
                                          },
                                          icon: Icon(Icons.delete)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          );
                        },
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
