import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/presentations/marketing/pages/marketing_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EditSuccessPage extends StatefulWidget {
  const EditSuccessPage({super.key});

  @override
  State<EditSuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<EditSuccessPage> {
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
        desc: "Target Berhasil diedit",
        buttons: [
          DialogButton(
            onPressed: () =>
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return const MarketingTargetPage();
            })),
            width: 120,
            color: Colors.yellow,
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),

        ],
      ).show();

    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    );
  }
}

