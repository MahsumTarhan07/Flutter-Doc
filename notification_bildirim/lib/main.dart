import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notifation - Bildirim Uygulamsi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _Anasayfa(),
    );
  }
}

class _Anasayfa extends StatelessWidget {
  var flp = FlutterLocalNotificationsPlugin();

  Future<void> kurulum() async {
    var androidSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher"); //icon resmi
    var iosSettings = const DarwinInitializationSettings();
    var kurulumSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);
    await flp.initialize(kurulumSettings,
        onDidReceiveNotificationResponse: bildirimSecilme);
  }

  Future<void> bildirimSecilme(
      NotificationResponse notificationResponse) async {
    var payload = notificationResponse.payload;

    if (payload != null) {
      print("Bildirim Yönlendirme : $payload");
    }
  }

  @override
  void initState() {
    kurulum();
  }

  Future<void> bildirimGoster() async {
    var androidNotification = const AndroidNotificationDetails(
        "kanal id", "konu başlık",
        channelDescription: "Kanal Acıklama yazısı",
        priority: Priority.high,
        importance: Importance.max);

    var iosNotificationAll = DarwinNotificationDetails();
    var notificationDetails = NotificationDetails(
        android: androidNotification, iOS: iosNotificationAll);
    await flp.show(0, "Başlık", "İçerik", notificationDetails,
        payload: "Payload icerik");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifation-Bidirim Uygulamasi"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Arada boluluk bırakır
            children: [
              ElevatedButton(
                onPressed: () {
                  bildirimGoster();
                },
                child: const Text("Bildirim Oluştur"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Bildirim Oluştur(Geciklmeli)"),
              )
            ],
          ),
        ));
  }
}
