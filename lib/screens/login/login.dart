
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Username"
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Password"
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed:() {
                      context.pushReplacement("/catalog");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow
                    ),
                    child: const Text("Enter"),
                )
              ],
            ),
        ),
      ),
    );
  }

}