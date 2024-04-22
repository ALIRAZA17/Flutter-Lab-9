import 'package:flutter/material.dart';

class ThirdPart extends StatefulWidget {
  const ThirdPart({super.key});

  @override
  State<ThirdPart> createState() => _ThirdPartState();
}

class _ThirdPartState extends State<ThirdPart> {
  fetchUsername() async {
    return Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () => 'Muhammad Ali Raza Dar');
  }

  addHello(user) {
    return 'Hello $user';
  }

  greetUser() async {
    String username = await fetchUsername();
    return addHello(username);
  }

  sayGoodbye() async {
    try {
      String result = await logoutUser();
      return '$result Thanks, see you next time';
    } catch (e) {
      return 'Caught error: ${e.toString()}';
    }
  }

  logoutUser() async {
    return Future.delayed(
        const Duration(milliseconds: 500), () => 'Muhammad Babar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 03', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder(
          future: greetUser(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator(
                      color: Colors.blue,
                    )
                  : snapshot.connectionState == ConnectionState.done
                      ? Text('${snapshot.data}')
                      : const Text('Error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          String message = await sayGoodbye();
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
