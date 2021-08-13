import 'package:flutter/material.dart';

class TelaDocumentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Documentação'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/img/documentos.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: "Para ser atendido leve os seguintes documentos:"),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: "1. Documento de identificação com foto (carteira de identidade, carteira de habilitação etc)"),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: "2. Comprovante de endereço (conta de luz, internet etc)"),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: "3. Cartão Nacional de Saúde (quando houver)."),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
