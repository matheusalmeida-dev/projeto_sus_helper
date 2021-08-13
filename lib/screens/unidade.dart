import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_sushelper/models/ubs_data.dart';

class TelaUnidade extends StatelessWidget {
  final Unidade unidade;
  const TelaUnidade ({this.unidade, Key key}) : super(key: key);

  String servicos (){
     List lista = unidade.servicos;
     return lista.join(", ") + '.';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(unidade.nome),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(unidade.img),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: 'Nome: ', style: TextStyle(fontWeight: FontWeight.bold,)),
                        TextSpan(text: unidade.nome),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: '\nTelefone: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: unidade.telefone),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: '\nEndereço: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: unidade.endereco),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: '\nServiços: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: servicos()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
