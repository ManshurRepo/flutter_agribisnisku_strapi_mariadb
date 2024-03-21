import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/presentations/business_target/pages/business_page.dart';
import 'package:flutter_agribisnisku/presentations/marketing/pages/marketing_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DeleteSuccessPage extends StatefulWidget {
  const DeleteSuccessPage({super.key});

  @override
  State<DeleteSuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<DeleteSuccessPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Alert(
        context: context,
        style: const AlertStyle(
          backgroundColor: Colors.white,
          animationType: AnimationType.grow,
          animationDuration: Duration(seconds: 1),
        ),
        type: AlertType.success,
        desc: "Target Berhasil dihapus",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const BusinessTargetPage();
            })),
            width: 120,
            color: Colors.yellow,
            radius: BorderRadius.circular(3),
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.black, fontSize: 20,),
            ),
          ),
        ],
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
