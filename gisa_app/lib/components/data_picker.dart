import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataPicker extends StatelessWidget {
  // List<String> docIDs = [];
  final int qNum, aNum;

  final String quest, a1, a2, a3, a4;

  final String documentId;

  const DataPicker(this.qNum, this.aNum, this.quest, this.a1, this.a2, this.a3,
      this.a4, this.documentId,
      {super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference exams = FirebaseFirestore.instance.collection('exams');

    return FutureBuilder<DocumentSnapshot>(
      future: exams.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("a_num: ${data['a_num']} ${data['q_num']}");
        }

        return const Text("loading");
      },
    );
  }
}
//     return FutureBuilder<DocumentSnapshot>(
//         future: exams.doc(documentId).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data!.data() as Map<String, dynamic>;
//             print('print $data');
//             return const Text('am');
//           }
//           return const Text('loading...');
//         });
//   }
// }

// Future getDocId() async {
//   await fireStore.collection('exams').get().then(
//         (snapshot) => snapshot.docs.forEach(
//           (document) {
//             // print(document.reference);
//             docIDs.add(document.reference.id);
//             // print(docIDs[0]);
//             // document.reference.toString();
//           },
//         ),
//       );
// }

// @override
// void initState() {
//   getDocId();
//   super.initState();
// }
// FirebaseFirestore fireStore = FirebaseFirestore.instance;

// Future<List<dynamic>> _getstockList() async {
//   Map<String, dynamic> userdocdata;

//   var testData = await fireStore.collection('exams').doc('exam1').get();
//   userdocdata = userdata.data() as Map<String, dynamic>;
//   List<dynamic> nlist = userdocdata['favorite'];
//   return nlist;
// }
// onPressed: () async {
//                 DocumentSnapshot testData =
//                     await fireStore.collection('exams').doc('exam1').get();
//                 print(testData.id);
//                 setState(() {
//                   name = testData['name'];
//                 });

  // void readData() {
  //   final ref = fireStore.collection('exams').doc("20200606_1_2");
  //   ref.get().then((value) => {print(value.data())});
  // }
