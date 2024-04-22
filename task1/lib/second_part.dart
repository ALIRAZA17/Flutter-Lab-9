import 'package:flutter/material.dart';

class SecondPart extends StatefulWidget {
  const SecondPart({super.key});
  @override
  State<SecondPart> createState() => _SecondPartState();
}

class _SecondPartState extends State<SecondPart> {
  reportLogins() async {
    int loginNumber = await fetchLoginAmount();
    return 'Total number of logins: $loginNumber';
  }

  fetchLoginAmount() async {
    return Future.delayed(
        const Duration(
          seconds: 1,
        ),
        () => 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 02', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder(
          future: reportLogins(),
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
