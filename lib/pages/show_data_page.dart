import 'package:firebase/Funcition/firebase_funcition.dart';
import 'package:firebase/pages/add_data_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FirebaseGetdata().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddDataPage(),
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
        future: FirebaseGetdata().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ExpansionTile(
                        title: Text(
                          snapshot.data![index].name.toString(),
                        ),
                        subtitle: Text(
                          snapshot.data![index].roll.toString(),
                        ),
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].deperment.toString(),
                                  ),
                                  Text(
                                    snapshot.data![index].email.toString(),
                                  ),
                                  Text(
                                    snapshot.data![index].phone.toString(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return const Text("Data Not Found");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
