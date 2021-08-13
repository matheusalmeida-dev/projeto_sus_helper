import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_sushelper/models/ubs_data.dart';

class TelaHome extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String texto;
    var pesquisa = context.read<Pesquisa>();
    return Scaffold(
      body: Container(
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Seja",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 6.0,
                                        color: Colors.black54,
                                      ),
                                    ])),
                            TextSpan(
                                text: "\nBem-Vindo!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 6.0,
                                        color: Colors.black54,
                                      ),
                                    ]))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      decorationColor: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.5),
                                  ),
                                  labelText: 'Pesquisar serviço',
                                ),
                                onChanged: (value) {
                                  texto = value;
                                },
                                onFieldSubmitted: (value){
                                  if (texto == null) {
                                    texto = "";
                                  }
                                  pesquisa.pesquisar(texto);
                                  Navigator.pushNamed(context, '/pesquisa');
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: ElevatedButton(
                              child: Icon(
                                Icons.search,
                                color: Colors.blueAccent,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.white,
                                onSurface: Colors.white,
                              ),
                              onPressed: () {
                                if (texto == null) {
                                  texto = "";
                                }
                                pesquisa.pesquisar(texto);
                                Navigator.pushNamed(context, '/pesquisa');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text(
                      "Cartão SUS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 8,
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        child: ListTile(
                          leading: Icon(
                            Icons.credit_card_outlined,
                            color: Colors.blueAccent,
                            size: 50,
                          ),
                          title: Text(
                            'Como adquirir o Cartão SUS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          onTap: (){
                            Navigator.pushNamed(context, '/cartao');
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(
                      "Acesso rápido",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              pesquisa.pesquisar("");
                              Navigator.pushNamed(context, '/pesquisa');
                            },
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 8,
                              child: Container(
                                alignment: Alignment.center,
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.local_hospital, color: Colors.red, size: 50,),
                                    Text(
                                      'Unidades de saúde',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/documentos');
                            },
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 8,
                              child: Container(
                                alignment: Alignment.center,
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.account_balance_wallet_outlined, color: Colors.deepPurple, size: 50,),
                                    Text(
                                      'Documentação',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
