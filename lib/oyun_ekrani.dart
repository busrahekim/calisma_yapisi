import 'dart:async';

import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {
  Kisiler kisi;
  OyunEkrani({required this.kisi});
  @override
  _OyunEkraniState createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  Future<bool> geriDonusTusu(BuildContext context) async {
    print("Navigation geri tuşu tıklandı");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oyun Ekranı"),
        leading: IconButton(
            onPressed: () {
              print("appbar geri tuşu tıklandı");
              Navigator.pop(context);
            },
            icon: const Icon(Icons
                .arrow_back_ios_sharp)), // leading = start = left ** trailing = end = right
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "Ad : ${widget.kisi.ad} - Yas : ${widget.kisi.yas} - Boy : ${widget.kisi.boy} - Bekar : ${widget.kisi.bekar}"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      //backstack'den siliyor
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SonucEkrani())));
                },
                child: const Text("BİTTİ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
