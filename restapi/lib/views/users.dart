import 'package:flutter/material.dart';
import 'package:restapi/models/usermodel.dart';
import 'package:restapi/views/adduser.dart';
import '../services/user_service.dart';

class LastExampleScreen extends StatefulWidget {
  const LastExampleScreen({Key? key}) : super(key: key);

  @override
  State<LastExampleScreen> createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {
  @override
  void initState() {
    super.initState();

    // initial load
    getUsers();
  }

  refreshList() {
    // reload
    setState(() {
      getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdU(),
              ))
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getUsers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          Card(
                            color: Colors.black,
                            elevation: 8,
                            shadowColor: Colors.grey,
                            margin: const EdgeInsets.all(20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                //leading: Icon(Icons.music_note),
                                subtitle: Text(
                                  snapshot.data.data[index].email,
                                  style: TextStyle(color: Colors.white),
                                ),
                                title: Text(
                                  snapshot.data.data[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                leading: ElevatedButton(
                                    onPressed: () => {},
                                    child: const Text("Update")),
                                trailing: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        deleteUser(
                                            snapshot.data.data[index].id);
                                      });
                                    },
                                    child: const Text("Delete")),
                              ),
                            ),
                          )
                        ]);
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
