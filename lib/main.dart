  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:projeto_sushelper/models/ubs_data.dart';
import 'package:projeto_sushelper/screens/home.dart';
import 'package:projeto_sushelper/screens/pesquisa.dart';
import 'package:projeto_sushelper/screens/cartao.dart';
import 'package:projeto_sushelper/screens/documentos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Future<List<Unidade>> carregarDados() async {

    final String response =
    await rootBundle.loadString('assets/dados/unidades.json');
    final data = await json.decode(response);
    List<Unidade> items = [];

    for (var item in data) {
      items.add(Unidade.fromJson(item));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Unidade>>(
      future: carregarDados(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              Provider(
                create: (context) => UnidadeCatalog(snapshot.data),
              ),
              Provider(
                create: (context) => Pesquisa(),
              ),
              Provider(
                create: (context) => FilterCatalog(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Viva o SUS',
              initialRoute: '/',
              routes: {
                '/': (context) => TelaHome(),
                '/pesquisa': (context) => TelaPesquisa(),
                '/cartao': (context) => TelaCartao(),
                '/documentos': (context) => TelaDocumentos(),
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}