import 'package:firebase_database/firebase_database.dart';
import '../entity/Kisiler.dart';

class KisilerDaoRepositor {
  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> kisiKayit(String kisi_ad,String kisi_tel) async {
    var bilgi = Map<String,dynamic>();
    bilgi["kisi_id"] = "";
    bilgi["kisi_ad"] = kisi_ad;
    bilgi["kisi_tel"] = kisi_tel;
    refKisiler.push().set(bilgi);
 }


  Future<void> KisiGuncele(String kisi_id, String kisi_ad, String kisi_tel) async {
    var bilgi = Map<String,dynamic>();
    bilgi["kisi_ad"] = kisi_ad;
    bilgi["kisi_tel"] = kisi_tel;
    refKisiler.child(kisi_id).update(bilgi);
  }


  Future<void> kisiSil(String kisi_id) async {
    refKisiler.child(kisi_id).remove();
  }
}
