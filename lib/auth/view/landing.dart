import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login or signup to continue.",
              style: TextStyle(fontSize: 30),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white, fontSize: 24),
                labelText: 'Email',
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white, fontSize: 24),
                labelText: 'Password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print("login pressed");
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
