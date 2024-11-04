import 'package:flutter/material.dart';

class ContainerJogo extends StatelessWidget {
  final Widget Function(int) box;
  const ContainerJogo({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.height/2,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9, 
        itemBuilder: (context, int index){
          return box(index);
        }
      ),
    );
  }
}