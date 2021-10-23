import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  const ThirdTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('testing').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>>snapshot,){
              if(!snapshot.hasData) return const SizedBox.shrink();

              return ListView.builder(
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder: (BuildContext context, int index){
                  final docData = snapshot.data!.docs[index].data();
                  final dateTime = (docData['timestamp'] as Timestamp).toDate();
                  return ListTile(
                    title: Text(dateTime.toString()),
                  );
                });
            },
          );
  }
}