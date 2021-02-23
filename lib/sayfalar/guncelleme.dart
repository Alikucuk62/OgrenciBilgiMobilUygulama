import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrencibilgi/Models/Ogrenciler.dart';

class guncelleme extends StatefulWidget{
  List ogrenciler;
  guncelleme(this.ogrenciler);
  @override
  State<StatefulWidget> createState() {

    return _GuncelleState ();
  }
}

class _GuncelleState extends State<guncelleme>{
  var formKey = GlobalKey<FormState>();
  var seciliogrenci = Ogrenciler(1, "ad", "soyisim");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Güncelleme"),

      ),
      body: SingleChildScrollView(

        child: Form(

          key: formKey,
          child: Column(



           children:[Text(seciliogrenci.ad+" "+seciliogrenci.soyisim),vizealani(),finalalani(),butunlemealani(), SubmitButton()],

      ),
    )

    ),);
  }


  vizealani() {
    return TextFormField(
      decoration: InputDecoration(labelText: "vize notu"),
      onSaved: (String value) {
        seciliogrenci.notvize = int.parse(value);
      },
    );
  }

  finalalani() {
    return TextFormField(
      decoration: InputDecoration(labelText: "final notu"),
      onSaved: (String value) {
        seciliogrenci.notfinal = int.parse(value);
      },
    );
  }

  butunlemealani() {
    return TextFormField(
      decoration: InputDecoration(labelText: "bütünleme notu"),
      onSaved: (String value) {
        if(value!=null){
          seciliogrenci.notbutunleme= int.parse(value);
        }
        else{
          TextInputAction.continueAction;
        }


      },
    );
  }

  Widget SubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        formKey.currentState.save();
        widget.ogrenciler[0]=seciliogrenci;
        Navigator.pop(context);
      },

    );
  }

}

