import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class maps extends StatefulWidget {
  const maps({super.key});

  @override
  State<maps> createState() => _mapsState();
}

class _mapsState extends State<maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('maps page')),
    
    );
  }
}