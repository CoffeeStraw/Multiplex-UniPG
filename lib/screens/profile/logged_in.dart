// Copyright 2020 Amatucci & Strippoli. All rights reserved.

import 'package:flutter/material.dart';

import 'package:cinema_app/transitions/slide_left_route.dart';
import 'cards.dart';

class LoggedInScreen extends StatefulWidget {
  final ValueChanged<bool> onLogin;
  const LoggedInScreen({this.onLogin});

  @override
  _State createState() => new _State(onLogin: onLogin);
}

class _State extends State<LoggedInScreen> {
  final ValueChanged<bool> onLogin;
  _State({this.onLogin});

  @override
  Widget build(BuildContext context) {
    void _onLogoutPressed() {
      onLogin(false);
    }

    void _onPaymentPressed() {
      Navigator.push(context, SlideLeftRoute(page: Cards()));
    }

    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: MediaQuery.of(context).size.height / 7,
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                        color: Theme.of(context).textTheme.title.color,
                        width: 2.0),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Oswald Green",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: MediaQuery.of(context).size.height / 25,
                      ),
                    ),
                    Text(
                      "Perugia (PG)",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 42,
                        letterSpacing: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          _listDrop("Password", "********", null),
          _listDrop("Email", "prova@example.com", null),
          _listDrop("Pagamento", "Visa xxxx-xxxx-xxxx-1234", _onPaymentPressed),
          _tileLogout("Logout", "Effettua il logout di questo account",
              _onLogoutPressed),
        ],
      ),
    );
  }

  Widget _listDrop(primary, secondary, func) {
    return ListTile(
      title: Text(
        primary,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height / 40,
        ),
      ),
      subtitle: Text(secondary,
          style: TextStyle(
            color: Theme.of(context).textTheme.title.color.withOpacity(0.5),
          )),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Theme.of(context).textTheme.title.color.withOpacity(0.5),
      ),
      onTap: func,
    );
  }

  Widget _tileLogout(text, secondary, func) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height / 40,
        ),
      ),
      subtitle: Text(secondary,
          style: TextStyle(
            color: Theme.of(context).textTheme.title.color.withOpacity(0.5),
          )),
      onTap: func,
    );
  }
}
