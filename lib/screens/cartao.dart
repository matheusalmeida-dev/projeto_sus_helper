import 'package:flutter/material.dart';

class TelaCartao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Cartão SUS'),
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
                  image: AssetImage('assets/img/cartao.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
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
                        TextSpan(text: "Vá até uma Unidade Básica de Saúde, levando o "),
                        TextSpan(text: 'RG', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                        TextSpan(text: " e "),
                        TextSpan(text: 'CPF', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                        TextSpan(text: "."),
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
                        TextSpan(text: "É impresso na hora, mas caso isso não aconteça, você receberá poucos dias depois."),
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
                        TextSpan(text: "Também é possível fazer o cartão SUS pelo app "),
                        TextSpan(text: 'Conecte SUS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                        TextSpan(text: "!"),
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
