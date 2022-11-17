import 'package:flutter/material.dart';
import 'package:healthcare_mania/database_helper/database_helper.dart';
import 'package:healthcare_mania/screens/edit_screen.dart';


class ListScreen extends StatefulWidget {
  static const String id ='list_screen';

  const ListScreen({Key key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<ListScreen> {

  // All data
  List<Map<String, dynamic>> myData = [];
  bool _isLoading = true; //ロードしたかどうかの　boolフラグ

  // This function is used to fetch all data from the database
  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myData = data; //マップ＋リストに反映
      _isLoading = false; //読み込み済みのフラグをオン
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading the data when the app starts
  }

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('記録一覧'),
      ),

      body: _isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : myData.isEmpty ? const Center(child: Text("現在データはありません")) : ListView.builder(
        itemCount: myData.length,
        itemBuilder: (context, index) => Card(
          color: index % 2 == 0 ? Colors.orange : Colors.orange[200],
          margin: const EdgeInsets.all(15),
          child: ListTile(
              title: Text(myData[index]['title']),
              subtitle: Text(myData[index]['description']),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => const EditScreen(),
                  ),
                );
              },
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (builder) => const EditScreen(),
                              ),
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          deleteItem(myData[index]['id']),
                    ),
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder:(context)=>  const EditScreen(),
            ),
        ),
      ),
    );
  }
  void deleteItem(int id)  {
    DatabaseHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('削除しました'), backgroundColor: Colors.green));
    _refreshData();
  }
}
