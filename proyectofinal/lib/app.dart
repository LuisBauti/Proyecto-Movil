// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:proyectofinal/main.dart';

class MyAppForm extends StatefulWidget {
  MyAppForm({Key? key}) : super(key: key);

  @override
  _MyAppFormState createState() => _MyAppFormState();
}

class _MyAppFormState extends State<MyAppForm> {
  String? _nombre;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/usuario.png'),
              ),
              Divider(height: 70.0, color: Colors.white),
              Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'cursive',
                  fontSize: 35.0,
                ),
              ),
              Divider(
                height: 18.0,
              ),
              SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Colors.blueGrey[600]),
              ),
              TextField(
                enableInteractiveSelection: false,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: 'Nombre de Usuario',
                  labelText: 'Nombre de Usuario',
                  suffixIcon: Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onSubmitted: (valor) {
                  _nombre = valor;
                  print(_nombre);
                },
              ),
              Divider(
                height: 18.0,
              ),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.alternate_email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onSubmitted: (valor) {
                    _email = valor;
                    print(_email);
                  }),
              Divider(
                height: 18.0,
              ),
              TextField(
                  enableInteractiveSelection: false,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Contraseña',
                      labelText: 'Contraseña',
                      suffixIcon: Icon(Icons.lock_clock_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onSubmitted: (valor) {
                    _password = valor;
                    print(_password);
                  }),
              Divider(
                height: 15.0,
              ),
              ElevatedButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));                
                  },
                  child: Text('Sing in'),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white70),
                  ),               
              )
            ],
          )
        ],
      ),
    );
  }
}

