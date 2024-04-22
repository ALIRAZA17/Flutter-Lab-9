import 'package:flutter/material.dart';

class FirstPart extends StatefulWidget {
  const FirstPart({super.key});

  @override
  State<FirstPart> createState() => _FirstPartState();
}

class _FirstPartState extends State<FirstPart> {
  Future<String> reportUserRole() async {
    String userRole = await fetchRole();
    return Future.delayed(
        const Duration(seconds: 2), () => 'User role: $userRole');
  }

  Future<String> fetchRole() async {
    return Future.delayed(const Duration(seconds: 1), () => 'Student');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 1', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder(
          future: reportUserRole(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator()
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
