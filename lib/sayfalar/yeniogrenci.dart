import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrencibilgi/Models/Ogrenciler.dart';
import 'package:ogrencibilgi/main.dart';

class ogrenciekle extends StatefulWidget {
  List ogrenciler;
  ogrenciekle(this.ogrenciler);
  @override
  State<StatefulWidget> createState() {
    return _OgrenciEkleState();
  }
}

class _OgrenciEkleState extends State<ogrenciekle> {
  var formKey = GlobalKey<FormState>();
  var ogrenci = Ogrenciler(1, "ad", "soyisim");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [idalani(), isimalani(), soyadalani(), SubmitButton()],
            )),
      ),
    );
  }

  idalani() {
    return TextFormField(
      decoration: InputDecoration(labelText: "id"),
      onSaved: (String value) {
        ogrenci.id = int.parse(value);
      },
    );
  }

  isimalani() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı"),
      onSaved: (String value) {
        ogrenci.ad = value;
      },
    );
  }

  soyadalani() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci soyadı"),
      onSaved: (String value) {
        ogrenci.soyisim = value;
      },
    );
  }

  Widget SubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        formKey.currentState.save();
        widget.ogrenciler.add(ogrenci);
        Navigator.pop(context);
      },

    );
  }
}
