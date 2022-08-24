import 'package:flutter/material.dart';
import 'package:la_vie/presentation/widgets/login_widgets.dart';

class LeavesScreen extends StatefulWidget {
  const LeavesScreen({Key? key}) : super(key: key);

  @override
  _LeavesScreenState createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          TextButton(onPressed: (){
            signOut(context);
          }, child: Text('LogOut'))
        ],
      ),
    );
  }
}
