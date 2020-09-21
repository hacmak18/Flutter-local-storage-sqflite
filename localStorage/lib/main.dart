import 'package:flutter/material.dart';
import 'package:localStorage/database_helper.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite localDB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
            FlatButton(onPressed: ()async{
                 int i =await DatabaseHelper.instance.insert({
                  DatabaseHelper.columnName:'mak',
                });
                print('Inserted id: $i');

            },child: Text('Insert'),color: Colors.grey),
            FlatButton(onPressed: () async{
              List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
              print(queryRows);
            },child: Text('Query'),color: Colors.red),
            FlatButton(onPressed: ()async{
              int updatedId=await DatabaseHelper.instance.update({
                DatabaseHelper.columnID:4,
                DatabaseHelper.columnName:'Mayur'
              });

              print(updatedId);
            },child: Text('Update'),color: Colors.grey),
            FlatButton(onPressed: ()async{
              int rowEffected=await DatabaseHelper.instance.delete(4);
              print(rowEffected);
            },child: Text('Delete'),color: Colors.red)
        ],),
      ),
    );
  }
}