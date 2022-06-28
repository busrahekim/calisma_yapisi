// ignore_for_file: library_private_types_in_public_api

import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> with WidgetsBindingObserver {
  int sayac = 0;
  bool k = false;
  @override
  void initState() {
    super.initState();
    print("initstate çalıştı");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      print("inactive çalıştı");
    }
    if (state == AppLifecycleState.paused) {
      print("paused çalıştı");
    }
    if (state == AppLifecycleState.resumed) {
      print("resumed çalıştı");
    }
    if (state == AppLifecycleState.detached) {
      print("detached çalıştı");
    }
  }

  Future<int> factorail(int num) async {
    int s = 1;
    for (var i = 1; i <= num; i++) {
      s = s * i;
    }
    return s;
  }

  @override
  Widget build(BuildContext context) {
    print("build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç : $sayac"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sayac = sayac + 1;
                });
              },
              child: const Text("Tıkla"),
            ),
            ElevatedButton(
              onPressed: () {
                var kisi =
                    Kisiler(ad: "Ahmet", yas: 23, boy: 1.78, bekar: true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => OyunEkrani(
                            kisi: kisi,
                          )),
                    )).then((_) {
                  print("Anasayfaya dönüldü");
                });
              },
              child: const Text("BAŞLA"),
            ),
            Visibility(
              child: const Text("hello"),
              visible: k,
            ),
            Text(
              k ? "hello" : "x",
              style: TextStyle(color: k ? Colors.blue : Colors.red),
            ),
            (() {
              if (k) {
                return const Text("hello");
              } else {
                return const Text("x");
              }
            }()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  k = true;
                });
              },
              child: const Text("DURUM 1 : TRUE"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  k = false;
                });
              },
              child: const Text("DURUM 2 : FALSE"),
            ),
            FutureBuilder<int>(
              future: factorail(5),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("error");
                }
                if (snapshot.hasData) {
                  return Text("sonuc : ${snapshot.data}");
                } else {
                  return const Text("no result");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
