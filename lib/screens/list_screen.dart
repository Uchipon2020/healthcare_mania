import 'package:flutter/material.dart';
import 'package:healthcare_mania/database_helper/database_helper.dart';
import 'package:healthcare_mania/screens/detail_screen.dart';

class ListScreen extends StatefulWidget {
  static const String id ='list_screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ListScreen> {
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

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void showMyForm(int id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingData = myData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descriptionController.text = existingData['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // prevent the soft keyboard from covering the text fields
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'タイトル'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(hintText: '内容'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save new data
                  if (id == null) {
                    await addItem();
                  }

                  if (id != null) {
                    await updateItem(id);
                  }

                  // Clear the text fields
                  _titleController.text = '';
                  _descriptionController.text = '';

                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? '新規作成' : '更新'),
              )
            ],
          ),
        ));
  }

// Insert a new data to the database
  Future<void> addItem() async {
    await DatabaseHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshData();
  }

  // Update an existing data
  Future<void> updateItem(int id) async {
    await DatabaseHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshData();
  }

  // Delete an item
  void deleteItem(int id) async {
    await DatabaseHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('記録成功'), backgroundColor: Colors.green));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メモ帳'),
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
                Navigator.pushNamed(context, DetailScreen.id);
              },
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          showMyForm(myData[index]['id']),
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
        onPressed: () => showMyForm(null),
      ),
    );
  }
}
