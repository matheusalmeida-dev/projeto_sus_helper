import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_sushelper/models/ubs_data.dart';
import 'package:projeto_sushelper/screens/unidade.dart';

class TelaPesquisa extends StatefulWidget {
  @override
  _TelaPesquisaState createState() => _TelaPesquisaState();
}

class _TelaPesquisaState extends State<TelaPesquisa> {
  List<String> constroiLista(List<Unidade> unidades){
    List<String> lista = [];
    for (Unidade unidade in unidades){
      lista.add(unidade.nome);
    }
    return lista;
  }

  Widget _buildListTile(BuildContext context, Unidade unidade) {
    return ListTile(
      leading: Icon(Icons.local_hospital, color: Colors.red, size: 30,),
      title: Text(unidade.nome),
      trailing: Icon(Icons.arrow_forward),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaUnidade(
              unidade: unidade,
            ),
          ),
        );
      },
    );
  }

  bool listaFiltrada (String texto, List<Unidade> lista, FilterCatalog catalogo){
    catalogo.removeAll();
    for (Unidade unidade in lista){
      if (unidade.nome.contains(texto)){
        catalogo.add(unidade);
      }
      if (unidade.servicos.contains(texto) && !(catalogo.unidades.contains(unidade))){
        catalogo.add(unidade);
      }
    }
    return catalogo.unidades.isNotEmpty;
  }

  Widget geraConsumer (bool filtro){
    if (filtro == true){
      return Consumer<FilterCatalog>(
        builder: (context, catalog, child) {
          return ListView(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            children: catalog.unidades.map((Unidade unidade) {
              return _buildListTile(context, unidade);
            }).toList(),
          );
        },
      );
    }else{
      return Text('Resultado não encontrado!', style: TextStyle(fontWeight: FontWeight.bold),);
    }
  }
  @override
  Widget build(BuildContext context) {
    var catalogo = context.read<FilterCatalog>();
    var unidades = context.read<UnidadeCatalog>();
    var listaU = unidades.items;
    var pesquisa = context.read<Pesquisa>();
    IconButton botao = IconButton(
      onPressed: () {
        showSearch(context: context, delegate: Search(constroiLista(listaU)), query: pesquisa.pesquisa);
        pesquisa.limpar();
      },
      icon: Icon(Icons.search),
    );
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          botao
        ],
        centerTitle: true,
        title: Text('Pesquisar serviços'),
      ),
      body: Container(
        child: Center(
          child: geraConsumer(listaFiltrada(pesquisa.pesquisa, listaU, catalogo)),
        ),
      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }


  void listaFiltrada (String texto, List<Unidade> lista, FilterCatalog catalogo){
    catalogo.removeAll();
    for (Unidade unidade in lista){
      if (unidade.nome.contains(texto)){
        catalogo.add(unidade);
      }
      if (unidade.servicos.contains(texto) && !(catalogo.unidades.contains(unidade))){
        catalogo.add(unidade);
      }
    }
  }

  Widget _buildDetail(BuildContext context, Unidade unidade) {
    return ListTile(
      leading: Icon(Icons.local_hospital, color: Colors.red, size: 30,),
      title: Text(unidade.nome),
      trailing: Icon(Icons.arrow_forward),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaUnidade(
              unidade: unidade,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    var lista = context.read<UnidadeCatalog>();
    var catalogo = context.read<FilterCatalog>();
    listaFiltrada(query, lista.items, catalogo);
    return Container(
      child: Center(
        child: Consumer<FilterCatalog>(
          builder: (context, catalog, child) {
            return ListView(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              children: catalog.unidades.map((Unidade unidade) {
                return _buildDetail(context, unidade);
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> constroiLista(List<Unidade> unidades){
    List<String> lista = [];
    for (Unidade unidade in unidades){
      lista.add(unidade.nome);
    }
    return lista;
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    var unidades = context.read<UnidadeCatalog>();
    var listaU = unidades.items;
    List<String> suggestionList = [];
    List<String> lista = constroiLista(listaU);
    if (query.isEmpty){
      suggestionList = lista;
    }else{
      for (Unidade unidade in listaU){
        if (unidade.nome.contains(query)){
          suggestionList.add(unidade.nome);
        }if (unidade.servicos.contains(query)){
          suggestionList.add(unidade.nome);
        }
      }
    }

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          trailing: Icon(Icons.arrow_forward),
          leading: Icon(Icons.local_hospital, color: Colors.red, size: 30,),
          onTap: (){
            showResults(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaUnidade(
                  unidade: listaU[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}