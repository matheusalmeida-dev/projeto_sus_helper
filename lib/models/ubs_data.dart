import 'dart:collection';

class Unidade {
  final String nome;
  final String endereco;
  final String img;
  final String telefone;
  final List servicos;

  Unidade(this.nome, this.endereco, this.img, this.telefone, this.servicos);


  Unidade.fromJson(Map<String, dynamic> json)
    : nome = json['nome'],
      endereco = json['endereco'],
      img = json['img'],
      telefone = json['telefone'],
      servicos = json['servicos'];
}

class UnidadeCatalog {
  List<Unidade> items = [];
  UnidadeCatalog(this.items);
  List<Unidade> get unidades => items;
}

class FilterCatalog {
  final List<Unidade> _unidades = [];

  UnmodifiableListView<Unidade> get unidades => UnmodifiableListView(_unidades);

  void add (Unidade unidade){
    _unidades.add(unidade);
  }

  void removeAll(){
    _unidades.clear();
  }
}

class Pesquisa {
  String _pesquisa = "";
  String get pesquisa => _pesquisa;

  void pesquisar(String pesquisa){
    _pesquisa = pesquisa;
  }
  void limpar(){
    _pesquisa = "";
  }
}
