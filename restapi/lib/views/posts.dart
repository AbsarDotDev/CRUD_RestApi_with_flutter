import 'package:flutter/material.dart';
import 'package:restapi/services/post_service.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
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
                          snapshot.data[index].body,
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          snapshot.data[index].title.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
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
    );
  }
}
