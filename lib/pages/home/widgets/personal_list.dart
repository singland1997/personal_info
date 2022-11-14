import 'package:flutter/material.dart';

class PersonalList extends StatelessWidget {
  const PersonalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person6.jpg'),
                ),
                title: Text('Name $index'),
                subtitle: const Text('jeneDoe@email.com'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
