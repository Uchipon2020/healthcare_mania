import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_mania/database_helper/database_helper.dart';
import 'package:path/path.dart';

class EditScreen extends StatefulWidget{
  //static const String id ='edit_screen';

  const EditScreen({Key key, index}) : super(key: key);
  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen>{

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<Map<String, dynamic>> myData = [];
  int index = (Context index);
  int id = index;

  void showMyForm(int id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingData = myData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descriptionController.text = existingData['description'];
    }

 /*   showModalBottomSheet(
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
        ));*/
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

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading the data when the app starts
  }

  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myData = data; //マップ＋リストに反映
      //_isLoading = false; //読み込み済みのフラグをオン
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('編集画面'),
      ),
      body: Column(
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
              showMyForm(myData[index]['id']);
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
          ),
        ],
      ),
    );
  }
}