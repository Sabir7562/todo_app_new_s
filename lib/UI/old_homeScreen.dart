// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/local/dbHelper.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => HomePageState();
// }
//
// class HomePageState extends State<HomePage> {
//   // Database Object
//   Dbhelper? mainDB;
//   // Blank List
//   List<Map<String, dynamic>> allNotes = [];
//
//   ///--------------------
//   @override
//   void initState() {
//     super.initState();
//     mainDB = Dbhelper.getInstance;
//     getinitialNote(); // Fetch initial notes
//   }
//
//   void getinitialNote() async {
//     allNotes = await mainDB!.getAllNote();
//     setState(() {});
//   }
//
//   ///------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Todo Home"),
//         backgroundColor: Colors.yellow,
//       ),
//       body: allNotes.isNotEmpty
//           ? ListView.builder(
//         itemCount: allNotes.length,
//         itemBuilder: (_, index) {
//           return ListTile(
//             title: Text(allNotes[index][Dbhelper.column_title_name]),
//             subtitle: Text(allNotes[index][Dbhelper.column_desc_name]),
//           );
//         },
//       )
//           : Center(child: Text("No Data Fetched yet")),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.yellow,
//         onPressed: () async {
//           await mainDB!.addData(title: "Sample Title", desc: "Sample Desc");
//           getinitialNote(); // Refresh data after insertion
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
