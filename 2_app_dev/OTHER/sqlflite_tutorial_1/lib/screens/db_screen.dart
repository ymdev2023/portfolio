import 'package:flutter/material.dart';
import 'package:sqlflite_tutorial_1/models/sample.dart';
import '../repository/sql_sample.crud.dart';
import '../services/detail.dart';
import '../utils/data.dart';

class DBScreen extends StatefulWidget {
  const DBScreen({super.key});

  @override
  State<DBScreen> createState() => _DBScreenState();
}

class _DBScreenState extends State<DBScreen> {
  void createdRandomSample() async {
    double value = DataUtils.randomValue();
    var sample = Sample(
      createdAt: DateTime.now(),
      name: DataUtils.makeUUID(),
      value: value,
      yn: value % 2 == 0,
    );
    await SqlSampleCrudRepository.create(sample);
    update();
  }

  void update() => setState(() {});
  Widget _sampleOne(Sample sample) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(sample: sample),
          ),
        );
      },
      child: Container(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: sample.yn ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(sample.name)
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                sample.createdAt.toIso8601String(),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          )),
    );
  }

  Future<List<Sample>?> _loadSampleList() async {
    return await SqlSampleCrudRepository.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite Sample'),
      ),
      body: FutureBuilder<List<Sample>?>(
        future: _loadSampleList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Not support sqlflite'),
            );
          }
          if (snapshot.hasData) {
            var datas = snapshot.data;
            return ListView(
              children: List.generate(
                  datas!.length, (index) => _sampleOne(datas[index])),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createdRandomSample,
        child: const Icon(Icons.add),
      ),
    );
  }
}
