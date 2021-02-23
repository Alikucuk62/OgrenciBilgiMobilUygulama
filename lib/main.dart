import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrencibilgi/sayfalar/guncelleme.dart';
import 'package:ogrencibilgi/sayfalar/yeniogrenci.dart';
import 'package:flutter/material.dart';
import 'Models/Ogrenciler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  createAlertDialog(BuildContext context){
    TextEditingController customContreller =TextEditingController();
    TextEditingController customContreller2 =TextEditingController();
    TextEditingController customContreller3=TextEditingController();
    TextEditingController customContreller4 =TextEditingController();

    return showDialog(context: context,builder: (context)
        {
      return AlertDialog(
        

        title: Text("Güncelleme"),
        content:Column(


          children: [TextField(

            decoration: InputDecoration(
                border:OutlineInputBorder(),
                labelText: "Vize Notu"
            ),
            controller:customContreller ,

          ),
            TextField(
              decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: "Final Notu"
              ),
              controller:customContreller2 ,
            ),
            TextField(

              decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: "Bütünleme Notu"
              ),
              controller:customContreller3 ,

            ),
          ],


        )




        ,actions: [
          MaterialButton(
            elevation: 5.0,
            onPressed: (){

              if(customContreller.text==""){

              }
              else{
                seciliogrenci.notvize=int.parse(customContreller.text);
                setState(() {

                });
              }
              if(customContreller2.text==""){



              }
              else{
                seciliogrenci.notfinal=int.parse(customContreller2.text);
                setState(() {
                });


              }
              if(customContreller3.text==""){

              }
              else{
                seciliogrenci.notbutunleme=int.parse(customContreller3.text);
                setState(() {

                });

              }






              Navigator.of(context).pop(context);
            },
            child: Text("Güncelle"),
          )
        ],
      );
    });
  }
  List<Ogrenciler> ogrencilist = [
    Ogrenciler(1, "Ali", "Küçük"),
    Ogrenciler(2, "Devran", "Gülşen"),
    Ogrenciler(3, "Hüseyin", "Özdemir")
  ];

  Ogrenciler seciliogrenci = Ogrenciler(0, "YOK", "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Öğrenci takip sistemi"),
            backgroundColor: Colors.lightBlueAccent),
        body: buildBody());
  }

  Widget buildBody() {
    // ogrencilist[0].notfinal=20;

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: ogrencilist.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      ogrencilist[index].ad + " " + ogrencilist[index].soyisim),
                  subtitle: Text(
                      "Vize Notu: " + ogrencilist[index].notvize.toString()),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(ogrencilist[index].imgurl),
                  ),
                  trailing: Text("DURUM: " + ogrencilist[index].getdurum),
                  onTap: () {
                    setState(() {
                      this.seciliogrenci = ogrencilist[index];
                    });
                  },
                );
              }),
        ),
        Text("Seçili öğrenci: " + seciliogrenci.ad),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Yeni Öğrenci")
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ogrenciekle(ogrencilist)));
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle")
                  ],
                ),
                onPressed: () {
                  createAlertDialog(context);

                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("SİL")
                  ],
                ),
                onPressed: () {
                  ogrencilist.remove(seciliogrenci);

                  setState(() {});
                },
              ),
            )
          ],
        )
      ],
    );
  }


}
