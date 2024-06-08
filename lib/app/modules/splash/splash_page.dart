import 'package:flutter/material.dart';

import '../../core/widgets/todo_list_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      // appBar: AppBar(title: const Text('Splash'),),
      // backgroundColor: const Color.fromARGB(255, 151, 222, 255),
      body:  Center(
        //child: CircularProgressIndicator(),
        child: TodoListLogo(),
      ),
    );
  }
}