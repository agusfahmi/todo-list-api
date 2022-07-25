import 'package:flutter/material.dart';

class ListUser extends StatelessWidget {
  final List nama = [
    "WAHYU BUDI UTOMO",
    "FARLI NAHRUL JAVIER",
    "DEVANIS DWI SUTRISNO",
    "FARKHAN HAMZAH FIRDAUS",
    "ARIEL BAGUS ARRASYIID",
    "SALSABILA AULIA RAMADHAN",
    "NUR SYAHFEI",
    "MUHAMMAD NUR ICHSAN",
    "VIRGIAWAN SAGARMATA PATABUGA",
    "BELLA DWI MARDIANA",
    "DINDA ARINAWATI WIYONO",
    "GILLY HUGA ANARGYA",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List User"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
         return SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
            child : Card(
              color: Colors.grey,
              child: Padding(padding: const EdgeInsets.all(15.0),
                child: Text(nama[index], style: TextStyle(fontSize: 15),),),
            ),
        );
      },
        itemCount: nama.length,
      ),
    );
  }
}
